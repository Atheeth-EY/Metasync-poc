-- Test that active_customers view uses lifecycle_status column and returns correct results
SELECT assert_true(
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status = 'ACTIVE') = 
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.active_customers),
  'active_customers view must return same count as filtering customer_profile by lifecycle_status = ACTIVE'
);

SELECT assert_true(
  NOT EXISTS (
    SELECT 1 FROM learning.atheeth_metasync_demo.active_customers ac
    LEFT JOIN learning.atheeth_metasync_demo.customer_profile cp 
      ON ac.customer_id = cp.customer_id
    WHERE cp.lifecycle_status != 'ACTIVE' OR cp.lifecycle_status IS NULL
  ),
  'active_customers view must contain only rows where lifecycle_status is ACTIVE'
);
