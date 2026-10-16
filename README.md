# E-Commerce Funnel Analysis | SQL & Power BI

## Project Overview

This project analyzes the e-commerce customer journey using SQL and Microsoft Power BI to understand how users move through different stages of the purchasing funnel, identify conversion bottlenecks, and evaluate customer purchasing behavior.

The analysis focuses on customer sessions across four key funnel stages: Browse, Add to Cart, Checkout, and Purchase. It also compares purchase conversion performance across marketing channels, devices, and geographical regions.

The objective is to transform raw event-level data into actionable business insights that can help an e-commerce business improve conversion rates, reduce customer drop-offs, and make data-driven decisions.

## Business Problem

E-commerce businesses attract users through multiple marketing channels and devices, but not every visitor completes a purchase. Understanding where potential customers leave the purchasing journey is essential for improving business performance.

This project addresses the following questions:

- How many sessions reach each stage of the purchasing funnel?
- At which stage does the largest drop-off occur?
- What percentage of browsing sessions result in purchases?
- Which marketing channels have higher purchase conversion rates?
- How does conversion performance vary across desktop, mobile, and tablet devices?
- Which geographical regions demonstrate stronger purchase conversion?
- How can the findings guide improvements to the customer journey?

## Tools and Technologies

- **MySQL:** Data querying, aggregation, funnel analysis, and conversion calculations.
- **Microsoft Power BI:** Interactive dashboard development and data visualization.
- **DAX:** Measures for calculating sessions, conversion rates, and revenue.
- **Microsoft Excel:** Supporting data inspection and validation.

## Project Workflow

### 1. Data Preparation

- Imported the e-commerce event dataset into MySQL and Power BI.
- Reviewed the available fields, including session IDs, event types, timestamps, devices, regions, channels, product categories, revenue, and bounce flags.
- Used SQL to aggregate event data and calculate funnel metrics.
- Created Power BI measures to support KPI calculations and visual analysis.

### 2. Funnel Analysis

Analyzed four stages of the customer journey:

1. Browse
2. Add to Cart
3. Checkout
4. Purchase

Calculated the number of sessions at each stage, stage-to-stage conversion rates, and drop-off rates to identify where the largest losses occur.

### 3. Performance Analysis

Compared purchase conversion rates across:

- **Marketing Channel:** Email, Google Ads, Organic, and Social Media.
- **Device:** Desktop, Mobile, and Tablet.
- **Region:** North, South, East, and West.

Also calculated purchase-related revenue to understand the revenue contribution captured by the dataset.

### 4. Dashboard Development

Developed an interactive Power BI dashboard containing:

- Key performance indicator (KPI) cards
- Customer funnel visualization
- Purchase conversion by marketing channel
- Purchase conversion by device
- Purchase conversion by region
- Funnel stage drop-off analysis
- Slicers for interactive filtering

The dashboard is designed to make important performance patterns easy to identify and interpret.

## Key Findings

The analysis identified the following patterns:

| Metric | Result |
|---|---:|
| Browse Sessions | 10,000 |
| Add to Cart Sessions | 7,048 |
| Checkout Sessions | 3,576 |
| Purchase Sessions | 1,115 |
| Overall Browse-to-Purchase Conversion | 11.15% |
| Browse-to-Add-to-Cart Drop-off | 29.52% |
| Add-to-Cart-to-Checkout Drop-off | 49.26% |
| Checkout-to-Purchase Drop-off | 68.82% |

### Key Insights

**1. Significant drop-off occurs at checkout completion**

The largest stage-level drop-off is between Checkout and Purchase, at 68.82%. This suggests an opportunity to investigate checkout usability, unexpected costs, payment failures, or other purchase-completion barriers. The dataset identifies the drop-off but does not establish its cause.

**2. Overall purchase conversion is 11.15%**

Out of 10,000 browsing sessions, 1,115 sessions recorded a purchase. This provides a baseline for tracking future conversion improvements.

**3. Conversion varies across marketing channels**

Email recorded the highest purchase conversion rate at approximately 11.58%, followed by Social Media at 11.22%, Google Ads at 10.96%, and Organic at 10.85%.

These differences can help guide further channel-level investigation, but conversion rate alone does not establish which channel is most profitable.

**4. Desktop has the highest device-level conversion**

Desktop recorded approximately 11.69% conversion, followed by Mobile at 11.29% and Tablet at 10.50%. This indicates a potential opportunity to investigate the user experience on tablet and mobile devices.

**5. Regional conversion performance varies**

North recorded the highest regional purchase conversion at approximately 12.18%, followed by West at 11.58%, South at 10.69%, and East at 10.20%.

Further analysis could explore whether these differences relate to customer behavior, marketing exposure, product preferences, or the user experience.

## Business Recommendations

Based on the observed patterns, the following actions are worth investigating:

- **Improve checkout completion:** Review checkout steps, payment errors, shipping charges, and unexpected fees.
- **Optimize the customer journey:** Investigate the causes of drop-offs between Browse, Add to Cart, Checkout, and Purchase.
- **Evaluate marketing performance:** Compare conversion rates alongside advertising spend, customer acquisition cost, and revenue before reallocating budgets.
- **Review device experience:** Test checkout usability and performance across desktop, mobile, and tablet.
- **Investigate regional differences:** Examine customer behavior and campaign performance in lower-converting regions.
- **Monitor performance over time:** Track conversion and drop-off trends to evaluate whether changes improve results.

## Dashboard Preview

![E-Commerce Funnel Analysis Dashboard](E-Commerce funnel analysis dashboard.png)

## Project Files

The repository is intended to contain the following project assets:

- `README.md` — Project overview, methodology, findings, and recommendations.
- `ecommerce-funnel-dashboard.png` — Screenshot of the Power BI dashboard.
- `funnel_analysis.sql` — SQL queries used for analysis.
- `ecommerce-funnel-analysis.pbix` — Interactive Power BI report.

*File names may differ depending on the files uploaded to the repository.*

## Limitations and Assumptions

- Funnel counts are based on sessions containing each recorded event. The counts do not independently verify that every session followed the stages in chronological order.
- Stage-level drop-off calculations compare the recorded counts between consecutive funnel stages. They should be interpreted in light of the event-tracking structure.
- Differences in conversion rates do not, by themselves, demonstrate causation or profitability.
- Revenue analysis uses recorded purchase-event revenue; additional validation may be needed to assess refunds, margins, and total business profitability.

## Conclusion

This project demonstrates how SQL and Power BI can be used together to analyze an e-commerce funnel, measure conversion performance, identify customer drop-off points, and communicate findings through an interactive dashboard.

The analysis highlights checkout completion as the primary area for further investigation while providing channel-, device-, and region-level comparisons to support data-driven decision-making.

## Skills Demonstrated

SQL | MySQL | Power BI | DAX | Data Cleaning | Data Analysis | KPI Development | Funnel Analysis | Data Visualization | Business Insights | Analytical Thinking
