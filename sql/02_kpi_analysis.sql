-- overall metrics
SELECT
  experiment_group,
  SUM(spend) AS total_spend,
  SUM(reach) AS total_reach,
  SUM(website_clicks) AS total_clicks,
  SUM(add_to_cart) AS total_add_to_cart,
  SUM(purchase) AS total_purchases
FROM `continual-bay-488211-a5.ab_testing_dataset.ab_combined_final`
GROUP BY experiment_group;


-- funnel + cost metrics
SELECT
  experiment_group,

  SAFE_DIVIDE(SUM(website_clicks), SUM(reach)) AS ctr,
  SAFE_DIVIDE(SUM(add_to_cart), SUM(website_clicks)) AS add_to_cart_rate,
  SAFE_DIVIDE(SUM(purchase), SUM(website_clicks)) AS conversion_rate,

  SAFE_DIVIDE(SUM(spend), SUM(website_clicks)) AS cost_per_click,
  SAFE_DIVIDE(SUM(spend), SUM(purchase)) AS cost_per_purchase

FROM `continual-bay-488211-a5.ab_testing_dataset.ab_combined_final`
GROUP BY experiment_group;
