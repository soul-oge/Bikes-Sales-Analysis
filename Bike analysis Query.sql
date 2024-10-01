with cte as (
SELECT * From bike_share_yr_0
union
SELECT * FROM bike_share_yr_1)

SELECT dteday,
season,
l.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders *  CONVERT(DECIMAL(10, 2), Price) as revenue,
riders * CONVERT(DECIMAL(10, 2), Price) -  CONVERT(DECIMAL(10, 2), COGS) as profit
FROM cte as l
LEFT JOIN cost_table as r
On l.yr = r.yr
