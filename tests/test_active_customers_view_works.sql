-- Test that active_customers view executes successfully with lifecycle_status
SELECT COUNT(*) FROM learning.atheeth_metasync_demo.active_customers;

SELECT assert_true(
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status = 'ACTIVE') = 
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.active_customers),
  'active_customers view must return same count as filtering customer_profile by lifecycle_status = ACTIVE'
);
