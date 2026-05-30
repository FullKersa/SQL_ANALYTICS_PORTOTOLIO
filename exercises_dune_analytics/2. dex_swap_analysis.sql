-- DEX Swap Analysis
-- Analyze swap activity on a DEX over the last 30 days

WITH swaps AS (
  SELECT
    block_time,
    token_bought_symbol,
    token_sold_symbol,
    amount_usd,
    taker,
    project
  FROM dex.trades
  WHERE block_time >= NOW() - INTERVAL '30' DAY
    AND project = 'uniswap'
)

SELECT
  DATE_TRUNC('day', block_time) AS day,
  COUNT(*) AS swap_count,
  COUNT(DISTINCT taker) AS unique_traders,
  ROUND(SUM(amount_usd), 2) AS total_volume_usd,
  ROUND(AVG(amount_usd), 2) AS avg_swap_size_usd,
  ROUND(SUM(amount_usd) / NULLIF(COUNT(DISTINCT taker), 0), 2) AS volume_per_trader
FROM swaps
GROUP BY 1
ORDER BY 1;
