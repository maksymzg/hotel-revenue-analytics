-- 02_monthly_seasonality.sql
-- AUDIT QUESTION (Hypothesis 2): is there genuine seasonality, or is volume flat?
--
-- FINDING: bookings and revenue are flat month-to-month (~25k bookings/month).
--          The only dip (Feb 2022) is a calendar artifact (28 days), not a seasonal
--          pattern. No market-driven seasonality → consistent with synthetic data.

SELECT strftime(Checkin_Date, '%Y-%m') AS year_month,
       COUNT(*)                        AS total_bookings,
       SUM(Net_Revenue)                AS total_net_revenue,
       SUM(Gross_Revenue)              AS total_gross_revenue
FROM bookings
GROUP BY year_month
ORDER BY year_month;
