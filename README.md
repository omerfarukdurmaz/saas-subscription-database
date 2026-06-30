# SaaS Subscription Database Management System 💳

This project features a comprehensive SQL database schema designed to handle Software-as-a-Service (SaaS) subscription models, user management, and automated billing cycles. It provides a robust backend structure for managing multi-tier subscription plans, tracking payment histories, and handling active/canceled user statuses.

### 🌟 Key Features
* **User & Account Management:** Tables designed to track user credentials, profiles, and account creation dates.
* **Subscription Tiering:** Supports multiple subscription tiers (e.g., Free, Basic, Premium) with dynamic pricing models.
* **Billing Cycles & Invoice Tracking:** Tracks recurring payment intervals, invoice generation, and billing histories.
* **Status Monitoring:** Real-time visibility into active, trial, suspended, or canceled subscription statuses.

### 🛠 Tech Stack
* **Database:** SQL / Relational Database Management System (RDBMS)

### 📊 Database Schema Overview
The database architecture includes structured relations for:
1. `Users / Accounts` - Core user profile data.
2. `Subscription Plans` - Available SaaS tiers, pricing, and features.
3. `User Subscriptions` - Mapping users to their active plans, start dates, and renewal periods.
4. `Invoices / Payments` - Transaction history, payment status, and logs.

### 🚀 How to Use
1. Clone or download this repository.
2. Import the `saas_subscription_db.sql` file into your local SQL environment (e.g., MySQL Workbench, PostgreSQL, or SQL Server).
3. Execute the script to generate the schema, relations, and sample data.
