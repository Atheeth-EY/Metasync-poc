-- Test that active_customers view uses lifecycle_status column
SELECT assert_true(
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.customer_profile WHERE lifecycle_status = 'ACTIVE') = 
  (SELECT COUNT(*) FROM learning.atheeth_metasync_demo.active_customers),
  'active_customers view must return same count as filtering customer_profile on lifecycle_status = ACTIVE'
);

SELECT assert_true(
  NOT EXISTS (
    SELECT 1 FROM learning.atheeth_metasync_demo.active_customers a
    LEFT JOIN learning.atheeth_metasync_demo.customer_profile p
    ON a.customer_id = p.customer_id
    WHERE p.lifecycle_status != 'ACTIVE' OR p.lifecycle_status IS NULL
  ),
  'active_customers view must contain only rows where lifecycle_status is ACTIVE'
);
