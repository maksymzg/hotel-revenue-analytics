# 🏨 Hotel Booking Data: Forensic Audit & Signal Assessment

> A rigorous statistical and SQL-based audit of a 300,000-row hotel booking dataset to determine its analytical viability.
> Stack: **SQL (DuckDB) · Python (pandas, scipy)**.

> 🚧 **Completed**

**🌐 [English](#english) · [Polski](#polski)**

---

## English

### Project status / Roadmap
- [x] **Phase 1: Data Cleaning & Validation** (`01_data_cleaning.ipynb`) - date conversion ✓, consistency validation ✓, anomaly removal ✓, revenue logic verified ✓, memory optimization ✓
- [x] **Phase 2: Signal Assessment & Data Forensics** (`02_signal_assessment.ipynb`) *(in progress)* - SQL grouping, Chi-Square tests, and distribution fingerprinting to test the dataset's claims.
- [x] **Phase 3: Final Verdict** (`reports/executive_summary.md`) - conclusion on data viability and usage recommendations.

### 1. Project Context & Pivot
Full description: [`reports/00_business_problem.md`](reports/00_business_problem.md).

This project initially began as a standard revenue analysis. However, during early exploratory analysis I found strong indicators of synthetic generation (e.g. perfectly flat margins across every segment). **The objective was pivoted to a Forensic Data Audit.** The goal is now to test the structural claims of the dataset and assess whether it contains genuine business signal or artificial noise.

### 2. Data
- **Source:** Kaggle - *ITC Hotels Sales* (`arjunguptadatanalyst/itc-hotels-sales`).
- **Size:** 300,000 bookings × 28 columns, April 2021 – April 2022, 15 hotels across India.
- **Nature:** Suspected synthetic data modelling hotel operations.
- **Download:** `Hotels.csv` is *gitignored* (57 MB). Download it from Kaggle into `data/raw/Hotels.csv`. A sample `data/sample/hotels_sample.csv` is included in the repo.

### 3. Tech stack & architecture
| Layer | Tool | Role |
|---|---|---|
| Cleaning / prep | Python (pandas) | data validation and type optimization |
| Forensic analysis | **DuckDB (SQL)** | rapid aggregations, CTEs, signal extraction |
| Statistical testing | Python (scipy, matplotlib) | distribution fingerprinting, hypothesis testing |

> **Why DuckDB:** in-process OLAP engine, reads Parquet files directly, no server required → reproducible project (`git clone` + notebook).

### 4. Repository structure
```text
data/        raw (gitignored) · sample (in repo) · processed (gitignored)
notebooks/   01_data_cleaning · 02_signal_assessment
sql/         signal assessment queries (DuckDB)
visuals/     PNG exports for the README
reports/     data viability audit (problem statement) + executive summary
```

### 5. Audit questions (hypothesis testing)
Detailed hypotheses: [`reports/00_business_problem.md`](reports/00_business_problem.md).
1. **Channel performance** - do booking channels exhibit statistically significant financial differences?
2. **Seasonality** - does the data reflect natural, market-driven seasonality?
3. **Customer segmentation** - do customer types show distinct purchasing-power patterns?
4. **Natural variance** - do core financial metrics follow natural (skewed) distributions or an artificial (uniform) spread?

### 6. Methodology
1. Data cleaning & formula validation → 2. SQL-based signal assessment → 3. Statistical distribution testing (Chi-Square, variance) → 4. Final verdict & documentation.

### 7. Key findings
* **SQL Flatness:** Performance metrics (e.g., net/gross margins) exhibit perfect mathematical uniformity across all dimensions, which is impossible in a real, competitive market.
* **Uniform Distributions:** Financial inputs (Room_Rate, Discount, Extra_Charges) follow perfectly flat, uniform distributions rather than natural, right-skewed market patterns.
* **Zero Correlations:** Inter-variable correlations hover at absolute zero (|r| ≤ 0.004), showing a complete lack of organic business relationships.
* **Categorical Independence:** Chi-square tests reveal no meaningful association between cancellation rates and booking channels or customer segments (Cramér's V ≈ 0).
* **Conclusion:** The dataset is highly synthetic, generated via independent random distributions, and fundamentally unsuitable for genuine business analysis.

Full verdict: [`reports/executive_summary.md`](reports/executive_summary.md) 

### 8. Recommendations
Restrict the use of this dataset strictly to technical skills practice (e.g., data cleaning pipelines, SQL syntax, or tool familiarization). For actual revenue analytics and BI dashboards, source operational data that contains natural market variance and structural interdependencies.

### 9. How to run
```bash
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt
# download Hotels.csv into data/raw/, then run the notebooks/ in VS Code
```

### 10. Author
**Maksym Wieczorek** - Master's student in Economic Data Analytics, UEP Poznań
LinkedIn: [Maksym Wieczorek](https://www.linkedin.com/in/maksym-wieczorek-31589b280/)

---

## Polski

### Status projektu / Roadmapa
- [x] **Faza 1: Czyszczenie i walidacja danych** (`01_data_cleaning.ipynb`) - konwersja dat ✓, walidacja spójności ✓, usunięcie anomalii ✓, weryfikacja logiki przychodu ✓, optymalizacja pamięci ✓
- [x] **Faza 2: Ocena sygnału i audyt śledczy** (`02_signal_assessment.ipynb`) *(w trakcie)* - zapytania SQL, testy Chi-kwadrat i analiza rozkładów w celu weryfikacji struktury danych.
- [x] **Faza 3: Werdykt końcowy** (`reports/executive_summary.md`) - ostateczna konkluzja o przydatności danych i rekomendacje.

### 1. Kontekst i pivot
Pełny opis: [`reports/00_business_problem.md`](reports/00_business_problem.md).

Projekt rozpoczął się jako standardowa analiza przychodów. Jednak we wczesnej analizie eksploracyjnej znalazłem silne wskaźniki sztucznego generowania (np. idealnie płaskie marże w każdym segmencie). **Cel projektu został zmieniony na Śledczy Audyt Danych.** Obecnym celem jest przetestowanie strukturalnych deklaracji zbioru i ocena, czy zawiera on autentyczny sygnał biznesowy, czy sztuczny szum.

### 2. Dane
- **Źródło:** Kaggle - *ITC Hotels Sales* (`arjunguptadatanalyst/itc-hotels-sales`).
- **Rozmiar:** 300 000 rezerwacji × 28 kolumn, kwiecień 2021 – kwiecień 2022, 15 hoteli w Indiach.
- **Charakter:** Podejrzewane dane syntetyczne modelujące operacje hotelowe.
- **Pobranie:** Plik `Hotels.csv` jest *gitignorowany* (57 MB). Pobierz z Kaggle do `data/raw/Hotels.csv`. W repo jest próbka `data/sample/hotels_sample.csv`.

### 3. Stack technologiczny i architektura
| Warstwa | Narzędzie | Rola |
|---|---|---|
| Czyszczenie | Python (pandas) | walidacja danych i optymalizacja typów |
| Analiza śledcza | **DuckDB (SQL)** | szybkie agregacje, CTE, ekstrakcja sygnału |
| Testy statystyczne | Python (scipy, matplotlib) | analiza rozkładów, testowanie hipotez |

> **Dlaczego DuckDB:** silnik OLAP in-process, czyta pliki Parquet wprost, zero serwera → projekt reprodukowalny (`git clone` + notebook).

### 4. Struktura repozytorium
```text
data/        raw (gitignored) · sample (w repo) · processed (gitignored)
notebooks/   01_data_cleaning · 02_signal_assessment
sql/         zapytania audytowe (DuckDB)
visuals/     eksporty PNG do README
reports/     problem biznesowy (deklaracja audytu) + executive summary
```

### 5. Pytania audytowe (testowanie hipotez)
Szczegółowe hipotezy: [`reports/00_business_problem.md`](reports/00_business_problem.md).
1. **Skuteczność kanałów** - czy kanały rezerwacji wykazują statystycznie istotne różnice finansowe?
2. **Sezonowość** - czy dane odzwierciedlają naturalną, rynkową sezonowość?
3. **Segmentacja klientów** - czy typy klientów wykazują odmienne wzorce siły nabywczej?
4. **Naturalna wariancja** - czy metryki finansowe mają naturalne (skośne) rozkłady, czy sztucznie równomierne?

### 6. Metodyka (etapy)
1. Czyszczenie i walidacja → 2. Ocena sygnału w SQL → 3. Testowanie statystyczne (Chi-kwadrat, wariancja) → 4. Werdykt końcowy i dokumentacja.

### 7. Kluczowe wnioski
* **Płaskość SQL:** Metryki wydajności (np. marże) wykazują idealną matematyczną równomierność we wszystkich wymiarach, co jest niemożliwe na prawdziwym rynku.
* **Rozkłady równomierne:** Zmienne finansowe (`Room_Rate`, `Discount`, `Extra_Charges`) mają płaskie, nieskośne rozkłady, co dowodzi użycia generatora liczb losowych.
* **Zerowe korelacje:** Korelacje międzyzmiennowe oscylują dokładnie wokół zera (|r| ≤ 0.004), ukazując całkowity brak organicznych asocjacji.
* **Niezależność kategoryczna:** Testy chi-kwadrat nie wykazały żadnego istotnego związku między wskaźnikami anulacji a kanałami rezerwacji czy segmentami (Cramér's V ≈ 0).
* **Wniosek:** Zbiór danych jest wysoce syntetyczny, wygenerowany z niezależnych zmiennych losowych i całkowicie nie nadaje się do wyciągania rzeczywistych wniosków biznesowych.

Pełny werdykt - [`reports/executive_summary.md`](reports/executive_summary.md) 

### 8. Rekomendacje
Zbiór ten należy wykorzystywać wyłącznie do ćwiczeń technicznych (np. czyszczenie danych, trenowanie zapytań SQL, testowanie narzędzi). Do rzeczywistych projektów analitycznych i budowy dashboardów BI należy pozyskać dane operacyjne zawierające naturalną, rynkową wariancję oraz zależności.

### 9. Jak uruchomić
```bash
python3 -m venv venv && source venv/bin/activate
pip install -r requirements.txt
# pobierz Hotels.csv do data/raw/, następnie odpalaj notebooks/ w VS Code
```

### 10. Autor
**Maksym Wieczorek** - Master's student in Economic Data Analytics, UEP Poznań
LinkedIn: [Maksym Wieczorek](https://www.linkedin.com/in/maksym-wieczorek-31589b280/)