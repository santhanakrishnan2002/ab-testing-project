# A/B Testing Case Study: Marketing Campaign Decision Analysis

## Executive Summary

A new marketing campaign variant (Test) was evaluated against the existing campaign (Control) to determine its impact on conversion performance and business outcomes.

The analysis shows that the test variant reduced conversion rate from 9.83% to 8.64%, representing a 12% relative decline. This difference is statistically significant (p < 0.001) and supported by Bayesian analysis, which indicates a near-zero probability that the test variant outperforms the control.

From a business perspective, this performance gap corresponds to approximately 2,149 lost purchases during the test period, translating to an estimated revenue loss of over $100,000.

Based on these findings, the test campaign should not be rolled out.

---

## Business Problem

The marketing team introduced a new campaign variant with the objective of improving user conversion.

The key decision to be addressed is whether the new campaign should replace the current version based on its impact on performance and revenue.

---

## Analytical Approach

The analysis was conducted using a structured framework:

- Data cleaning and validation  
- Funnel and KPI analysis  
- A/B test evaluation  
- Statistical significance testing  
- Bayesian probability estimation  
- Business impact assessment  

---

## Data and Tools

The dataset consists of campaign-level A/B testing data with the following metrics:
- Spend  
- Reach  
- Website clicks  
- Add-to-cart events  
- Purchases  
- Experiment group (Control vs Test)  

Tools used:
- Google BigQuery for data processing and analysis  
- Python (Colab) for statistical testing  
- Statsmodels for hypothesis testing  
- NumPy for Bayesian simulation  
- Looker Studio for visualization  

---

## Performance Analysis

| Metric            | Control | Test  | Change |
|------------------|--------|-------|--------|
| Conversion Rate  | 9.83%  | 8.64% | -12%   |

While the test campaign generated higher traffic, it resulted in lower conversion efficiency.

---

## Statistical Analysis

A two-proportion Z-test was conducted to evaluate the difference in conversion rates.

- Z-statistic: -10.5  
- P-value: < 0.001  

The result indicates that the decline in performance is statistically significant and not due to random variation.

---

## Bayesian Analysis

A Bayesian approach was used to estimate the probability that the test variant outperforms the control.

- Probability (Test > Control): approximately 0%

This confirms with high confidence that the test variant is inferior.

---

## Business Impact

- Expected purchases under control performance: approximately 17,786  
- Actual purchases under test: approximately 15,637  
- Estimated loss: approximately 2,149 purchases  

This corresponds to an estimated revenue loss of over $100,000, depending on average order value.

---

## Key Insight

The test variant increased traffic but reduced conversion efficiency, suggesting lower-quality traffic acquisition or friction in the lower stages of the funnel.

---

## Recommendation

The test campaign should not be rolled out.

The control campaign should be retained while further analysis is conducted to identify the cause of performance decline. A revised experiment should be designed after addressing potential issues in targeting, messaging, or user experience.

---

## Project Structure

ab-testing-gcp-marketing-case-study/
│  
├── sql/  
│   ├── 01_data_cleaning.sql  
│   ├── 02_kpi_analysis.sql  
│   ├── 03_ab_test_analysis.sql  
│  
├── notebooks/  
│   └── statistical_analysis_ab_test.ipynb  
│  
├── dashboard/  
│   └── looker_dashboard.png  
│  
└── README.md  

---

## Authors

Santhanakrishnan.J
Periyanayaki.M
