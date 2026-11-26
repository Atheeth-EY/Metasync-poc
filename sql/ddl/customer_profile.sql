-- Governed definition of learning.atheeth_metasync_demo.customer_profile
CREATE TABLE IF NOT EXISTS learning.atheeth_metasync_demo.customer_profile (
  customer_id     STRING NOT NULL COMMENT 'Unique customer identifier',
  full_name       STRING          COMMENT 'Customer full name (fake data)',
  customer_status STRING          COMMENT 'Lifecycle state: ACTIVE, DORMANT or CLOSED',
  signup_date     DATE            COMMENT 'Date the customer signed up'
)
COMMENT 'One row per customer with current status. Owner: customer data team.';
