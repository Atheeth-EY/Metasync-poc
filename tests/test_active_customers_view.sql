-- Test that active_customers view runs and filters on lifecycle_status
SELECT assert_true(
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.active_customers WHERE lifecycle_status IS NULL) = 0,
  'active_customers view must not contain any rows with NULL lifecycle_status'
);

SELECT assert_true(
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.active_customers WHERE lifecycle_status != 'ACTIVE') = 0,
  'active_customers view must not contain any rows where lifecycle_status is not ACTIVE'
);

SELECT assert_true(
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status = 'ACTIVE') = 
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.active_customers),
  'active_customers view must contain exactly the rows from customer_profile where lifecycle_status is ACTIVE'
);
