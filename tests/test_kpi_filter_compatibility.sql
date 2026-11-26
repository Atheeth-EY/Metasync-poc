-- Test that KPI filter expression is valid against customer_profile
SELECT assert_true(
  (SELECT COUNT(DISTINCT customer_id) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status = 'ACTIVE') > 0,
  'KPI filter lifecycle_status = ACTIVE must return at least one active customer'
);

SELECT assert_true(
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status NOT IN ('ACTIVE', 'DORMANT', 'CLOSED')) = 0,
  'All rows must have lifecycle_status in allowed values ACTIVE, DORMANT, CLOSED'
);
