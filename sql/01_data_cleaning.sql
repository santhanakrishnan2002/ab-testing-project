-- checking duplicates
SELECT
  campaign,
  date,
  experiment_group,
  COUNT(*) AS duplicate_count
FROM `continual-bay-488211-a5.ab_testing_dataset.ab_combined_1`
GROUP BY campaign, date, experiment_group
HAVING COUNT(*) > 1;


-- checking nulls and blanks
SELECT
  COUNTIF(campaign IS NULL OR campaign = '') AS blank_campaign,
  COUNTIF(date IS NULL OR date = '') AS blank_date,
  COUNTIF(spend IS NULL) AS null_spend,
  COUNTIF(noi IS NULL) AS null_noi,
  COUNTIF(reach IS NULL) AS null_reach,
  COUNTIF(website_clicks IS NULL) AS null_clicks,
  COUNTIF(add_to_cart IS NULL) AS null_add_to_cart,
  COUNTIF(purchase IS NULL) AS null_purchase,
  COUNTIF(experiment_group IS NULL OR experiment_group = '') AS blank_experiment_group
FROM `continual-bay-488211-a5.ab_testing_dataset.ab_combined_1`;


-- removing duplicates
CREATE OR REPLACE TABLE `continual-bay-488211-a5.ab_testing_dataset.ab_combined_2` AS
SELECT *
FROM (
  SELECT *,
         ROW_NUMBER() OVER (
           PARTITION BY campaign, date, experiment_group
         ) AS rn
  FROM `continual-bay-488211-a5.ab_testing_dataset.ab_combined_1`
)
WHERE rn = 1;


-- final cleaned table
CREATE OR REPLACE TABLE `continual-bay-488211-a5.ab_testing_dataset.ab_combined_final` AS
SELECT
  campaign,
  PARSE_TIMESTAMP('%d.%m.%Y', date) AS campaign_timestamp,
  spend,
  noi,
  reach,
  website_clicks,
  searches,
  view_content,
  add_to_cart,
  purchase,
  LOWER(TRIM(experiment_group)) AS experiment_group
FROM `continual-bay-488211-a5.ab_testing_dataset.ab_combined_2`
WHERE campaign IS NOT NULL
  AND experiment_group IS NOT NULL
  AND spend >= 0
  AND reach >= 0
  AND website_clicks >= 0
  AND purchase >= 0
  AND purchase <= website_clicks;
