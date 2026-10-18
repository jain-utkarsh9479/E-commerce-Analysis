# Power BI Dashboard Build Guide

The repository includes a static dashboard preview (`dashboard_preview.png`) and the CSV files needed to recreate it in Power BI Desktop. A `.pbix` file is not included; create it locally by following these steps.

## Import
1. Open Power BI Desktop.
2. Get Data → Text/CSV → select `data/ecommerce_orders.csv`.
3. Set `order_date` to Date; set `revenue`, `cost`, `profit`, `unit_price` to Decimal Number; `quantity` to Whole Number.
4. Create a report page named **Business Performance**.

## Suggested visuals
- Cards: Total Revenue, Total Profit, Profit Margin %, Orders, Return Rate %.
- Line chart: Revenue by month.
- Bar chart: Profit by category.
- Bar chart: Revenue by region.
- Bar chart: Profit by sales channel.
- Slicers: Order Date, Region, Category, Sales Channel.

## DAX measures
```DAX
Total Revenue = SUM(ecommerce_orders[revenue])
Total Profit = SUM(ecommerce_orders[profit])
Total Orders = DISTINCTCOUNT(ecommerce_orders[order_id])
Unique Customers = DISTINCTCOUNT(ecommerce_orders[customer_id])
Profit Margin % = DIVIDE([Total Profit], [Total Revenue], 0)
Returned Lines = CALCULATE(COUNTROWS(ecommerce_orders), ecommerce_orders[returned] = "Yes")
Return Rate % = DIVIDE([Returned Lines], COUNTROWS(ecommerce_orders), 0)
Average Order Value = DIVIDE([Total Revenue], [Total Orders], 0)
```

Use percentage formatting for Profit Margin % and Return Rate %. The included dashboard image is a Python-generated preview for portfolio reference, not a Power BI screenshot.
