-- Test that the Active Customer KPI filter expression works with lifecycle_status
SELECT COUNT(DISTINCT customer_id) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status = 'ACTIVE';

SELECT assert_true(
  (SELECT lifecycle_status FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status = 'ACTIVE' LIMIT 1) = 'ACTIVE',
  'KPI filter lifecycle_status = ACTIVE must return rows with lifecycle_status = ACTIVE'
);
