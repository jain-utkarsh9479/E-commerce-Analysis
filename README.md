# E-commerce Business Performance Analysis

**Tools:** SQL, Excel, Power BI (rebuild guide included)  
**Project type:** Portfolio case study  
**Dataset:** Synthetic, generated for this portfolio project; not real company data.

## Business question
How do product category, region, sales channel, discounts and returns relate to sales performance and profitability?

## What is included
- `data/ecommerce_orders.csv` — 1,200 synthetic order records.
- `data/ecommerce_analysis_workbook.xlsx` — source data and summary tabs.
- KPI summary CSVs for monthly, category, regional, channel and return analysis.
- `sql/analysis_queries.sql` — eight analysis queries.
- `dashboard/dashboard_preview.png` — static visual preview.
- `dashboard/power_bi_guide.md` — steps and DAX measures to recreate an interactive Power BI report.

## KPI snapshot (synthetic dataset)
- Total revenue: $85,602.17
- Total profit: $38,526.17
- Profit margin: 45.01%
- Return rate: 4.17%
- Highest-profit category: Electronics ($15,628.03 profit)

These figures describe the generated sample only and must not be represented as real business results.

## Method
1. Clean and inspect order-level records.
2. Aggregate performance by month, category, region, channel and discount band.
3. Compare profit and return patterns.
4. Translate patterns into recommendations to test, rather than claiming causal effects.

## Example recommendations to validate
- Review discount levels against profit margin, not revenue alone.
- Investigate product categories with elevated return rates.
- Compare channels on both total profit and average order value.
- Monitor monthly performance to identify seasonality.

## How to reproduce
1. Load `data/ecommerce_orders.csv` into PostgreSQL or another SQL database as `ecommerce_orders`.
2. Run queries in `sql/analysis_queries.sql`.
3. Open the Excel workbook for summary tabs.
4. Follow `dashboard/power_bi_guide.md` to create an interactive `.pbix` file.

## Limitations
The dataset is synthetic and designed for demonstration. The analysis illustrates a workflow; it does not establish real-world causal relationships.
