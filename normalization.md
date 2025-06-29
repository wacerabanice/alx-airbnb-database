# 🏗️ Airbnb Clone – Database Normalization to 3NF

This explains the normalization process used to design the Airbnb Clone database, ensuring it follows the principles of **Third Normal Form (3NF)**. 
The goal is to eliminate redundancy, ensure data integrity, and optimize performance.

-----------

### 📘 First Normal Form (1NF)

Database is in 1NF as:

* All attributes contain only **atomic (indivisible)** values.
* Each column contains values of a single type.
* Each record is **uniquely identifiable** by a primary key.

✅ **Applied:**
All tables (User, Property, Booking, Payment, Review, Message) use atomic attributes:

* No multivalued fields.
* All records have unique primary keys (UUID's).

-----------

### 📘 Second Normal Form (2NF)

Database is in 2NF if:

* It is in 1NF.
* All **non-key attributes are fully functionally dependent** on the **entire primary key** (especially important for composite keys).

✅ **Applied:**
Each table has a **single-column primary key** (not composite), so 2NF is inherently satisfied.

Examples:

* In `Booking`, `total_price`, `start_date`, `end_date`, and `status` are fully dependent on `booking_id`.
* In `Property`, fields like `name`, `description`, and `pricepernight` depend solely on `property_id`.

---------

### 📘 Third Normal Form (3NF)

Database in 3NF as:

* It is in 2NF.
* **No transitive dependencies** (i.e., non-key attributes do not depend on other non-key attributes).

✅ **Applied to All Tables:**
* Normalized `location` where multiple properties share the same structured regions (City, Country).

#### 🔸 `User`

* `user_id` is the PK.
* No derived or transitive attributes (e.g., no “full\_name”).
* `role` is atomic and not derived from any other attribute.

#### 🔸 `Property`

* `host_id` references `User(user_id)` — not embedded.
* No attributes are dependent on anything other than `property_id`.

#### 🔸 `Booking`

* `user_id` and `property_id` are FKs, not embedded data.
* `total_price` is denormalized for performance but considered acceptable as it is calculated at booking time and does not change.

#### 🔸 `Payment`

* `booking_id` is a FK, ensuring no duplicate payment info per booking.
* `amount` and `payment_method` depend only on `payment_id`.

#### 🔸 `Review`

* No transitive dependencies. `rating` and `comment` are directly dependent on `review_id`.

#### 🔸 `Message`

* Clear structure: each message has a sender, recipient, content, and timestamp.
* No transitive data (e.g., sender/recipient names are not stored redundantly).

---

## 🧼 Summary of Design Decisions for 3NF Compliance

| Table    | Decision for 3NF                                      |
| -------- | ----------------------------------------------------- |
| User     | Unique emails, separate roles, password hash only     |
| Property | Linked by FK to host, no derived fields               |
| Booking  | Denormalized `total_price` acceptable for performance |
| Payment  | Linked to Booking via FK                              |
| Review   | Separated from Booking for flexible review rules      |
| Message  | Sender/recipient modeled by FK references             |

