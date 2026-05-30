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
                'USDT',
                'USDC',
                'DAI',
                'FDUSD',
                'USDD',
                'FRAX',
                'TUSD'
            )
            AND token_bought_symbol NOT IN(
                'USDT',
                'USDC',
                'DAI',
                'FDUSD',
                'USDD',
                'FRAX',
                'TUSD'
            )
    ),
    SELL_ORDER AS (
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
            AND token_bought_symbol IN (
                'USDT',
                'USDC',
                'DAI',
                'FDUSD',
                'USDD',
                'FRAX',
                'TUSD'
            )
            AND token_sold_symbol NOT IN(
                'USDT',
                'USDC',
                'DAI',
                'FDUSD',
                'USDD',
                'FRAX',
                'TUSD'
            )
    ),
    CUMULATIVE_TOTAL_TOKEN AS (
        SELECT
            tx_from,
            token_bought_address,
            token_bought_amount,
            block_time,
            SUM(token_bought_amount) OVER (
                PARTITION BY
                    tx_from,
                    token_bought_address
                ORDER BY block_time ASC
            ) AS cumulative_total_token
        FROM BUY_ORDER
    )
SELECT *
FROM CUMULATIVE_TOTAL_TOKEN
LIMIT 10