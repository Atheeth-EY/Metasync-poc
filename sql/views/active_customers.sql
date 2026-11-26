-- Downstream view used by reporting
CREATE OR REPLACE VIEW learning.atheeth_metasync_demo.active_customers AS
SELECT customer_id, full_name, signup_date
FROM learning.atheeth_metasync_demo.customer_profile
WHERE lifecycle_status = 'ACTIVE';
