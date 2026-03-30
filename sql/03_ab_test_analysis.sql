-- conversion rate comparison
WITH summary AS (
  SELECT
    experiment_group,
    SAFE_DIVIDE(SUM(purchase), SUM(website_clicks)) AS conversion_rate
  FROM `continual-bay-488211-a5.ab_testing_dataset.ab_combined_final`
  GROUP BY experiment_group
)

SELECT
  MAX(IF(experiment_group = 'control', conversion_rate, NULL)) AS control_cr,
  MAX(IF(experiment_group = 'test', conversion_rate, NULL)) AS test_cr,

  MAX(IF(experiment_group = 'test', conversion_rate, NULL)) -
  MAX(IF(experiment_group = 'control', conversion_rate, NULL)) AS absolute_lift,

  SAFE_DIVIDE(
    MAX(IF(experiment_group = 'test', conversion_rate, NULL)) -
    MAX(IF(experiment_group = 'control', conversion_rate, NULL)),
    MAX(IF(experiment_group = 'control', conversion_rate, NULL))
  ) AS relative_lift

FROM summary;


-- totals for z-test
WITH totals AS (
  SELECT
    experiment_group,
    SUM(website_clicks) AS total_clicks,
    SUM(purchase) AS total_purchases
  FROM `continual-bay-488211-a5.ab_testing_dataset.ab_combined_final`
  GROUP BY experiment_group
)

SELECT
  MAX(IF(experiment_group='control', total_clicks, NULL)) AS control_clicks,
  MAX(IF(experiment_group='control', total_purchases, NULL)) AS control_purchases,
  MAX(IF(experiment_group='test', total_clicks, NULL)) AS test_clicks,
  MAX(IF(experiment_group='test', total_purchases, NULL)) AS test_purchases
FROM totals;
