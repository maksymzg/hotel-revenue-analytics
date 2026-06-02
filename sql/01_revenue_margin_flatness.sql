-- 01_revenue_margin_flatness.sql
-- AUDIT QUESTION (Hypotheses 1 & 3): do revenue and margin differ across business
-- dimensions (hotel, channel, segment), or are they mathematically flat?
--
-- Notes:
--   * Margin = SUM(Net) / SUM(Gross) — ratio of sums, NOT the average of per-row ratios.
--   * CAST(... AS DOUBLE) forces float division (the inputs are integers).
--   * Booking count = COUNT(*); each row is one booking (Booking_ID is not unique).
--
-- FINDING: every dimension returns near-identical figures (margin ~95.2% everywhere,
--          revenue within a few %). No group-level signal → consistent with synthetic data.

-- By hotel
SELECT Hotel_Name,
       SUM(Net_Revenue)                                      AS total_net_revenue,
       SUM(Gross_Revenue)                                    AS total_gross_revenue,
       SUM(Net_Revenue) / CAST(SUM(Gross_Revenue) AS DOUBLE) AS margin,
       COUNT(*)                                              AS total_bookings
FROM bookings
GROUP BY Hotel_Name
ORDER BY total_net_revenue DESC;

-- By booking channel
SELECT Booking_Channel,
       SUM(Net_Revenue)                                      AS total_net_revenue,
       SUM(Net_Revenue) / CAST(SUM(Gross_Revenue) AS DOUBLE) AS margin,
       COUNT(*)                                              AS total_bookings
FROM bookings
GROUP BY Booking_Channel
ORDER BY total_net_revenue DESC;

-- By customer type
SELECT Customer_Type,
       SUM(Net_Revenue)                                      AS total_net_revenue,
       SUM(Net_Revenue) / CAST(SUM(Gross_Revenue) AS DOUBLE) AS margin,
       COUNT(*)                                              AS total_bookings
FROM bookings
GROUP BY Customer_Type
ORDER BY total_net_revenue DESC;

-- By COVID impact level (note: totals differ only because of record counts;
-- revenue-per-booking is identical, so there is no economic effect)
SELECT Covid_Impact_Level,
       SUM(Net_Revenue)                                      AS total_net_revenue,
       SUM(Net_Revenue) / CAST(SUM(Gross_Revenue) AS DOUBLE) AS margin,
       COUNT(*)                                              AS total_bookings,
       SUM(Net_Revenue) / CAST(COUNT(*) AS DOUBLE)           AS revenue_per_booking
FROM bookings
GROUP BY Covid_Impact_Level;
