# Databricks notebook source
# MAGIC %md
# MAGIC ## Build customer_profile
# MAGIC Writes `learning.atheeth_metasync_demo.customer_profile` from fake source data.
# MAGIC Output columns: customer_id, full_name, lifecycle_status, signup_date.

# COMMAND ----------

from pyspark.sql import functions as F

raw_customers = spark.createDataFrame(
    [
        ("C001", "Asha Rao", "A", "2024-01-15"),
        ("C002", "Ben Ortiz", "D", "2023-07-02"),
        ("C003", "Chen Li", "A", "2025-03-20"),
        ("C004", "Dana Kim", "C", "2022-11-30"),
    ],
    "customer_id string, full_name string, status_code string, signup_date string",
)

# COMMAND ----------

customer_profile = raw_customers.select(
    "customer_id",
    "full_name",
    F.when(F.col("status_code") == "A", "ACTIVE")
    .when(F.col("status_code") == "D", "DORMANT")
    .otherwise("CLOSED")
    .alias("lifecycle_status"),
    F.to_date("signup_date").alias("signup_date"),
)

customer_profile.write.mode("overwrite").saveAsTable("learning.atheeth_metasync_demo.customer_profile")
