-- 00_setup_view.sql
-- Registers the cleaned dataset as a DuckDB view so every audit query reads `bookings`.
-- DuckDB reads the Parquet file directly — no server, no load step.
-- Run from the repository root.

CREATE OR REPLACE VIEW bookings AS
SELECT * FROM 'data/processed/hotels_clean.parquet';

-- Sanity check (should return 299,998 rows):
-- SELECT COUNT(*) FROM bookings;
