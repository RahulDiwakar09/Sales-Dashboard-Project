import pandas as pd
import matplotlib.pyplot as plt
import mysql.connector

# MySQL connection
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="diwakarr@9696",   # apna MySQL ka password daalo
    database="sales_dashboard"
)

# Query to fetch joined data (Orders + Customers)
query = """
SELECT 
    o.order_id,
    o.order_date,
    o.product,
    o.quantity,
    o.unit_price,
    o.channel,
    c.first_name,
    c.last_name,
    c.email,
    c.signup_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
"""

# Load data into pandas dataframe
df = pd.read_sql(query, connection)

print("Sample Data:")
print(df.head())

# --- Data Cleaning ---
df['order_date'] = pd.to_datetime(df['order_date'])
df['revenue'] = df['quantity'] * df['unit_price']

# --- KPIs ---
total_revenue = df['revenue'].sum()
avg_order_value = df.groupby('order_id')['revenue'].sum().mean()
top_product = df.groupby('product')['revenue'].sum().idxmax()
monthly_trend = df.groupby(df['order_date'].dt.to_period('M'))['revenue'].sum()

print("\n--- KPIs ---")
print(f"Total Revenue: {total_revenue}")
print(f"Average Order Value: {avg_order_value}")
print(f"Top Product: {top_product}")

# --- Visualization ---
plt.figure(figsize=(8,5))
monthly_trend.plot(kind='bar')
plt.title("Monthly Sales Trend")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.tight_layout()
plt.show()

# Close connection
connection.close()