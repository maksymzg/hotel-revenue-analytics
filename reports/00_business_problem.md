# Data Viability Audit: Assessing the "Hotels" Dataset for Business Analytics

## 1. The Context & Pivot
I initiated this project as a standard Exploratory Data Analysis (EDA) aimed at extracting business insights regarding revenue, channel performance, and seasonal trends from a 300,000-row hotel booking dataset (ITC Hotels).

However, during the initial exploratory analysis, I discovered highly suspicious, structural anomalies (e.g., perfectly flat margins across segments). Consequently, I made a strategic decision to pivot the project. Instead of searching for business insights in potentially synthetic data, I transitioned this project into a **Forensic Data Audit**.

## 2. Objective
My goal is to test the structural claims and assumptions underlying this dataset. I will assess whether the data contains organic, realistic market signals, or if it is primarily generated noise. This is a critical "sanity check" that, in a real-world environment, protects businesses from making decisions based on flawed data.

## 3. The Audit Questions (Hypothesis Testing)
To definitively evaluate the dataset's credibility, instead of calculating standard KPIs, I will conduct rigorous statistical tests and SQL queries around four core hypotheses:

* **Hypothesis 1: Channel Performance.** Do different booking channels (e.g., Direct, OTA, Corporate) exhibit distinct, statistically significant financial behaviors (e.g., real differences in ADR or margins), or are they mathematically flat?
* **Hypothesis 2: Seasonality.** Does the data reflect natural, market-driven seasonality (e.g., genuine seasonal variation)?
* **Hypothesis 3: Customer Segmentation.** Do different customer types (VIP, Corporate, Regular) actually demonstrate different purchasing power and unique discount utilization patterns?
* **Hypothesis 4: Natural Variance.** Do core financial metrics (Room_Rate, Extra_Charges) follow natural (e.g., right-skewed) distributions, or do they exhibit an artificially uniform spread across the entire range?

## 4. Deliverable
The final product of this project will be a conclusive analytical verdict on the dataset and a recommendation (or lack thereof) regarding its suitability for further analytical processes.