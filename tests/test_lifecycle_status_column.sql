-- Test that lifecycle_status column exists and customer_status does not
SELECT assert_true(
  (SELECT COUNT(*) FROM learning.information_schema.columns 
   WHERE table_catalog = 'learning' 
   AND table_schema = 'atheeth_metasync_demo' 
   AND table_name = 'customer_profile' 
   AND column_name = 'lifecycle_status') = 1,
  'lifecycle_status column must exist in customer_profile table'
);

SELECT assert_true(
  (SELECT COUNT(*) FROM learning.information_schema.columns 
   WHERE table_catalog = 'learning' 
   AND table_schema = 'atheeth_metasync_demo' 
   AND table_name = 'customer_profile' 
   AND column_name = 'customer_status') = 0,
  'customer_status column must not exist in customer_profile table'
);
