# Miary DAX — dokumentacja (Power BI)

> Tu opisujemy każdą miarę: nazwę, wzór DAX i interpretację biznesową.
> Wypełniane w trakcie budowy dashboardu (etap 6).

## Podstawowe
- **Total Net Revenue** — `SUM(Net_Revenue)` — <!-- TODO interpretacja -->
- **Total Gross Revenue** — `SUM(Gross_Revenue)` —
- **Margin %** — `DIVIDE([Total Net Revenue], [Total Gross Revenue])` —
- **ADR** — <!-- TODO: przychód pokojowy / room-nights -->
- **ALOS** — `AVERAGE(Nights_Stayed)` —
- **Cancellation Rate** — <!-- TODO: Cancelled / wszystkie -->
- **Discount Rate** — `DIVIDE(SUM(Discount), [Total Gross Revenue])` —

## Zaawansowane
- **Margin Leakage Rate** — <!-- TODO: (Gross−Net)/Gross, z osią czasu -->
- **Revenue at Risk** — <!-- TODO: Net_Revenue rezerwacji anulowanych -->
- **Discount Effectiveness** — <!-- TODO: relacja rabat vs wolumen/rating -->

## YoY / czas
- **Revenue YoY %** — <!-- TODO: 2022 vs 2021 -->
