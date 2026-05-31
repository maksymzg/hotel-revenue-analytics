# Hotel Revenue & Profitability Analytics — ITC Hotels

> Analiza przychodów i rentowności sieci hotelowej (2021–2022, faza odbicia po COVID).
> Stack: **SQL (DuckDB) · Python (pandas) · Power BI**.

<!-- TODO: 2–3 zdania executive TL;DR + 1 screenshot dashboardu jako baner -->

---

## 1. Problem biznesowy
Pełny opis: [`reports/00_business_problem.md`](reports/00_business_problem.md).

Pytanie zarządu (w skrócie): *skąd realnie pochodzi przychód, gdzie tracimy marżę, i które dźwignie (kanał, segment, ceny, rabaty) pociągnąć, by rosnąć rentownie?*

## 2. Dane
- **Źródło:** Kaggle — *ITC Hotels Sales* (`arjunguptadatanalyst/itc-hotels-sales`).
- **Rozmiar:** 300 000 rezerwacji × 28 kolumn, 2021–2022, 15 hoteli w Indiach.
- **Charakter:** dane **syntetyczne, modelujące realne operacje hotelowe** (nie sprzedaję ich jako produkcyjne).
- **Pobranie:** plik `Hotels.csv` jest *gitignorowany* (57 MB). Pobierz z Kaggle i wrzuć do `data/raw/Hotels.csv`. W repo jest próbka `data/sample/hotels_sample.csv` (struktura bez ściągania całości).

## 3. Stack technologiczny i architektura
| Warstwa | Narzędzie | Rola |
|---|---|---|
| Czyszczenie / feature eng. | Python (pandas) | przygotowanie danych |
| Analiza | **DuckDB (SQL)** | agregacje, window functions, CTE |
| Prezentacja | Power BI | dashboard executive + operational |

> **Dlaczego DuckDB:** silnik OLAP in-process, czyta pliki wprost, zero serwera → projekt reprodukowalny (`git clone` + notebook). Logika SQL przenośna na PostgreSQL.

## 4. Struktura repozytorium
```
data/        raw (gitignored) · sample (w repo) · processed (gitignored)
notebooks/   01_cleaning · 02_eda · 03_feature_engineering
sql/         zapytania analityczne (DuckDB)
dashboard/   .pbix + udokumentowane miary DAX
visuals/     eksporty PNG do README
reports/     problem biznesowy + executive summary
```

## 5. KPI i pytania biznesowe
Definicje i hipotezy: [`reports/00_business_problem.md`](reports/00_business_problem.md).
- Podstawowe: Net/Gross Revenue, Margin %, ADR, ALOS, Cancellation Rate, Discount Rate, Channel mix.
- Zaawansowane: **Margin Leakage Rate w czasie**, **Revenue at Risk %**, **Discount Effectiveness**.

## 6. Metodyka (etapy)
1. Business understanding → 2. Data cleaning → 3. SQL analysis → 4. EDA & feature engineering → 5. Insight synthesis → 6. Power BI dashboard → 7. Executive summary & rekomendacje.

## 7. Kluczowe wnioski
<!-- TODO: 3–5 najmocniejszych insightów z liczbami i ₹ -->

## 8. Rekomendacje
<!-- TODO: rekomendacje decyzyjne + szacowany wpływ; w tym scenariusz polityki depozytu -->

## 9. Ograniczenia danych (świadome)
- **RevPAR** wymaga liczby dostępnych pokoi, której zbiór nie zawiera → nie raportuję go jako KPI. W analizie pokazuję dolny limit pojemności wyliczony z nakładania pobytów oraz jak policzyłbym RevPAR mając pole inventory.
- Brak powtarzalnego ID klienta → brak prawdziwego CLV / analizy retencji.
- Dane syntetyczne → wnioski ilustrują metodę analityczną, nie realia konkretnej firmy.

## 10. Jak uruchomić
```bash
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt
# pobierz Hotels.csv do data/raw/, następnie odpalaj notebooks/ w VS Code
```

## 11. Autor
Maksym Wieczorek - Master's student in Economic Data Analytics, UEP Poznań
LinkedIN: [CHECK LINK](https://www.linkedin.com/in/maksym-wieczorek-31589b280/)
