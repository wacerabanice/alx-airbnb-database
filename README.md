
# 🏡 Airbnb Clone – Backend

A fully functional backend for an Airbnb-like booking platform. 
This system manages users, properties, bookings, payments, reviews, and messaging – all structured in a normalized relational database designed for performance, scalability, and clarity.

---

## 📁 Project Structure


airbnb-clone-backend/

├── schema.sql               # SQL script to create database schema
├── sample_data.sql          # SQL insert statements for sample data
├── requirements.md          # Data model and field specification
├── normalization.md         # Normalization process to 3NF
├── airbnb_er_diagram.png    # Visual Entity-Relationship diagram
├── README.md                # Main project readme
├── sample_data_README.md    # Notes for the sample data file

---

## 🔧 Technologies Used

* **PostgreSQL** – Database
* **UUID** – For unique primary keys
* **SQL** – Schema and data definition
* **ER Modeling** – via Graphviz (diagram)
* **Markdown** – Docs and documentation

---

## ✅ Features

* 👤 **User Management** (Guest, Host, Admin roles)
* 🏘️ **Property Listings** (Name, Description, Price, Host link)
* 📅 **Booking System** (Dates, Status, Guest → Property)
* 💳 **Payments** (Linked to bookings, method, amount)
* ⭐ **Reviews** (1–5 stars, comments, user + property linked)
* 💬 **Messaging** (User-to-user communication)

---

