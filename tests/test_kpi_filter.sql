-- Test that the KPI filter expression works with lifecycle_status
SELECT assert_true(
  (SELECT COUNT(DISTINCT customer_id) 
   FROM learning.atheeth_metasync_demo.customer_profile 
   WHERE lifecycle_status = 'ACTIVE') = 
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.active_customers),
  'KPI filter lifecycle_status = ACTIVE must return the same count as active_customers view'
);

SELECT assert_true(
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status IN ('ACTIVE', 'DORMANT', 'CLOSED')) =
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.customer_profile),
  'All rows in customer_profile must have lifecycle_status in allowed values ACTIVE, DORMANT, CLOSED'
);
