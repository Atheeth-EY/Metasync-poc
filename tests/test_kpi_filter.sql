-- Test that KPI filter expression works with lifecycle_status
SELECT assert_true(
  (SELECT COUNT(DISTINCT customer_id) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status = 'ACTIVE') > 0,
  'Active Customer KPI filter must return at least one active customer'
);

SELECT assert_true(
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status IN ('ACTIVE', 'DORMANT', 'CLOSED')) = 
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.customer_profile),
  'All rows must have lifecycle_status in allowed values (ACTIVE, DORMANT, CLOSED)'
);

SELECT assert_true(
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status NOT IN ('ACTIVE', 'DORMANT', 'CLOSED') OR lifecycle_status IS NULL) = 0,
  'No rows may have lifecycle_status outside allowed values or NULL'
);
