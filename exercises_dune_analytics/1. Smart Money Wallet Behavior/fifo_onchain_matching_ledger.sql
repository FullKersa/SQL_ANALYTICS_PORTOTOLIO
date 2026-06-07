WITH
    BUY_ORDER AS (
        SELECT
            tx_from,
            token_bought_address,
            token_bought_symbol,
            token_bought_amount,
            amount_usd,
            block_time
        FROM DEX.TRADES
        WHERE
            BLOCK_MONTH = DATE '2026-04-01'
            AND token_sold_symbol IN (
                'USDT', 'USDC', 'DAI', 'FDUSD', 'USDD', 'FRAX', 'TUSD'
            )
            AND token_bought_symbol NOT IN (
                'USDT', 'USDC', 'DAI', 'FDUSD', 'USDD', 'FRAX', 'TUSD'
            )
            AND tx_from IN (
                from_hex('93d4d4cfa8b386b87dfec0382b06b08b2601d1b5'),
                from_hex('fae000a93a3aba2fa854448b2181568e709f05e8'),
                from_hex('ae2fc483527b8ef99eb5d9b44875f005ba1fae13'),
                from_hex('a875d2ef094ad0135a58001894091753d07138cb')
            )
    ),
    SELL_ORDER AS (
        SELECT
            tx_from,
            token_sold_address,
            token_sold_symbol,
            token_sold_amount,
            amount_usd,
            block_time
        FROM DEX.TRADES
        WHERE
            BLOCK_MONTH = DATE '2026-04-01'
            AND token_bought_symbol IN (
                'USDT', 'USDC', 'DAI', 'FDUSD', 'USDD', 'FRAX', 'TUSD'
            )
            AND token_sold_symbol NOT IN (
                'USDT', 'USDC', 'DAI', 'FDUSD', 'USDD', 'FRAX', 'TUSD'
            )
            AND tx_from IN (
                from_hex('93d4d4cfa8b386b87dfec0382b06b08b2601d1b5'),
                from_hex('fae000a93a3aba2fa854448b2181568e709f05e8'),
                from_hex('ae2fc483527b8ef99eb5d9b44875f005ba1fae13'),
                from_hex('a875d2ef094ad0135a58001894091753d07138cb')
            )
    ),
    CUMULATIVE_TOTAL_BUY AS (
        SELECT
            tx_from,
            token_bought_address,
            token_bought_amount,
            amount_usd, -- Ditambahin di sini biar lolos ke bawah
            block_time,
            SUM(token_bought_amount) OVER (
                PARTITION BY tx_from, token_bought_address
                ORDER BY block_time ASC
            ) AS cumulative_total_token_bought
        FROM BUY_ORDER
    ),
    CUMULATIVE_TOTAL_SELL AS (
        SELECT
            tx_from,
            token_sold_address,
            token_sold_amount,
            amount_usd, -- Ditambahin di sini biar lolos ke bawah
            block_time,
            SUM(token_sold_amount) OVER (
                PARTITION BY tx_from, token_sold_address
                ORDER BY block_time ASC
            ) AS cumulative_total_token_sold
        FROM SELL_ORDER
    ),
    FIFO_MATCHING AS (
        SELECT
            b.tx_from,
            b.token_bought_address AS token_address,
            b.block_time AS buy_time,
            s.block_time AS sell_time,
            b.token_bought_amount,
            s.token_sold_amount,
            (b.amount_usd / NULLIF(b.token_bought_amount, 0)) AS buy_price_usd_per_token,
            (s.amount_usd / NULLIF(s.token_sold_amount, 0)) AS sell_price_usd_per_token,
            CASE
                WHEN (b.cumulative_total_token_bought - b.token_bought_amount) > (s.cumulative_total_token_sold - s.token_sold_amount) 
                THEN (b.cumulative_total_token_bought - b.token_bought_amount)
                ELSE (s.cumulative_total_token_sold - s.token_sold_amount)
            END AS start_bound,
            CASE
                WHEN b.cumulative_total_token_bought < s.cumulative_total_token_sold 
                THEN b.cumulative_total_token_bought
                ELSE s.cumulative_total_token_sold
            END AS end_bound
        FROM
            CUMULATIVE_TOTAL_BUY b
            INNER JOIN CUMULATIVE_TOTAL_SELL s ON b.tx_from = s.tx_from
            AND b.token_bought_address = s.token_sold_address
            AND (b.cumulative_total_token_bought - b.token_bought_amount) < s.cumulative_total_token_sold
            AND b.cumulative_total_token_bought > (s.cumulative_total_token_sold - s.token_sold_amount)
    )

SELECT
    tx_from,
    token_address,
    (end_bound - start_bound) AS matched_token_amount,
    (end_bound - start_bound) * (sell_price_usd_per_token - buy_price_usd_per_token) AS realized_pnl_usd
FROM FIFO_MATCHING
WHERE (end_bound - start_bound) > 0
