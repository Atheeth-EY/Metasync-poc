# customer_profile

`learning.atheeth_metasync_demo.customer_profile` holds one row per customer with their current status. All data is fake.

| Column | Type | Description |
|---|---|---|
| customer_id | STRING | Unique customer identifier |
| full_name | STRING | Customer full name |
| customer_status | STRING | Lifecycle state: ACTIVE, DORMANT or CLOSED |
| signup_date | DATE | Date the customer signed up |

**Built by:** `notebooks/customer_profile.py`  
**Definition:** `sql/ddl/customer_profile.sql`  
**Used by:** `sql/views/active_customers.sql` and the Active Customer KPI in `semantic/customer_contract.yaml` (`customer_status = 'ACTIVE'`)
