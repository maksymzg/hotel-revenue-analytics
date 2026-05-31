## English

# Hotel Revenue & Profitability Analytics - ITC Hotels

> Revenue and profitability analysis of a hotel chain (April 2021 – April 2022, post-COVID recovery).
> Stack: **SQL (DuckDB) · Python (pandas) · Power BI**.

> 🚧 **Work in progress** - this project is actively being built.
> Current stage: **data cleaning**. See the roadmap below.

### Project status / Roadmap
- [x] **Business understanding** - problem, KPIs, hypotheses defined ([`reports/00_business_problem.md`](reports/00_business_problem.md))
- [ ] **Data cleaning** *(in progress)* - date conversion ✓, consistency validation ✓, anomaly removal ✓, revenue logic verified ✓, type optimization & processed dataset (pending)
- [ ] **SQL analysis** - business questions Q1–Q6 in DuckDB
- [ ] **EDA & feature engineering** - KPI metrics, hypothesis testing
- [ ] **Power BI dashboard** - executive & operational views
- [ ] **Executive summary & recommendations** - decision memo with estimated impact

---

## 1. Business problem
Full description: [`reports/00_business_problem.md`](reports/00_business_problem.md).

Management question (in short): *where does revenue really come from, where are we losing margin, and which levers (channel, segment, pricing, discounts) should we pull to grow profitably?*

## 2. Data
- **Source:** Kaggle - *ITC Hotels Sales* (`arjunguptadatanalyst/itc-hotels-sales`).
- **Size:** 300,000 bookings × 28 columns, April 2021 – April 2022, 15 hotels across India.
- **Nature:** **synthetic data modelling realistic hotel operations** (not sold as production data).
- **Download:** `Hotels.csv` is *gitignored* (57 MB). Download it from Kaggle into `data/raw/Hotels.csv`. A sample `data/sample/hotels_sample.csv` is included in the repo (structure without the full download).

## 3. Tech stack & architecture
| Layer | Tool | Role |
|---|---|---|
| Cleaning / feature eng. | Python (pandas) | data preparation |
| Analysis | **DuckDB (SQL)** | aggregations, window functions, CTEs |
| Presentation | Power BI | executive + operational dashboard |

> **Why DuckDB:** in-process OLAP engine, reads files directly, no server → reproducible project (`git clone` + notebook). SQL logic is portable to PostgreSQL.

## 4. Repository structure

```
data/        raw (gitignored) · sample (w repo) · processed (gitignored)
notebooks/   01_cleaning · 02_eda · 03_feature_engineering
sql/         zapytania analityczne (DuckDB)
dashboard/   .pbix + udokumentowane miary DAX
visuals/     eksporty PNG do README
reports/     problem biznesowy + executive summary
```

## 5. KPIs & business questions
Definitions and hypotheses: [`reports/00_business_problem.md`](reports/00_business_problem.md).
- Core: Net/Gross Revenue, Margin %, ADR, ALOS, Cancellation Rate, Discount Rate, Channel mix.
- Advanced: **Margin Leakage Rate over time**, **Revenue at Risk %**, **Discount Effectiveness**.

## 6. Methodology (stages)
1. Business understanding → 2. Data cleaning → 3. SQL analysis → 4. EDA & feature engineering → 5. Insight synthesis → 6. Power BI dashboard → 7. Executive summary & recommendations.

## 7. Key findings
<!-- TODO: 3–5 strongest insights with numbers and ₹ impact -->

## 8. Recommendations
<!-- TODO: decision-oriented recommendations + estimated impact; including the deposit-policy scenario -->

## 9. Data limitations (by design)
- **RevPAR** requires available-room counts the dataset does not contain → not reported as a KPI. The analysis instead shows a lower-bound capacity estimate derived from overlapping stays, and how RevPAR would be computed given an inventory field.
- No recurring customer ID → no true CLV / retention analysis.
- Synthetic data → findings illustrate the analytical method, not a specific company's reality.

## 10. How to run
```bash
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt
# download Hotels.csv into data/raw/, then run the notebooks/ in VS Code

# UPDATES
> 🚧 **Work in progress** - this project is actively being built.
> Current stage: **data cleaning**. See the roadmap below.
```
## 11. Author
- Maksym Wieczorek - Master's student in Economic Data Analytics, UEP Poznań
- LinkedIN: [Maksym Wieczorek](https://www.linkedin.com/in/maksym-wieczorek-31589b280/)

---


## Polski

> 🚧 **W trakcie realizacji** - projekt jest aktywnie rozwijany.
> Aktualny etap: **czyszczenie danych**. Roadmapa poniżej.

### Status projektu / Roadmapa
- [x] **Zrozumienie problemu biznesowego** - problem, KPI, hipotezy zdefiniowane ([`reports/00_business_problem.md`](reports/00_business_problem.md))
- [ ] **Czyszczenie danych** *(w trakcie)* - konwersja dat ✓, walidacja spójności ✓, usunięcie anomalii ✓, weryfikacja logiki przychodu ✓, optymalizacja typów i zapis przetworzonego zbioru (w toku)
- [ ] **Analiza SQL** - pytania biznesowe Q1–Q6 w DuckDB
- [ ] **EDA i feature engineering** - metryki KPI, testowanie hipotez
- [ ] **Dashboard Power BI** - widoki executive i operacyjny
- [ ] **Podsumowanie i rekomendacje** - memo decyzyjne z szacowanym wpływem

---

## 1. Problem biznesowy
Pełny opis: [`reports/00_business_problem.md`](reports/00_business_problem.md).

Pytanie zarządu (w skrócie): *skąd realnie pochodzi przychód, gdzie tracimy marżę, i które dźwignie (kanał, segment, ceny, rabaty) pociągnąć, by rosnąć rentownie?*

## 2. Dane
- **Źródło:** Kaggle - *ITC Hotels Sales* (`arjunguptadatanalyst/itc-hotels-sales`).
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
- Maksym Wieczorek - Master's student in Economic Data Analytics, UEP Poznań
- LinkedIN: [Maksym Wieczorek](https://www.linkedin.com/in/maksym-wieczorek-31589b280/)
