### 🔍 **Run EXPLAIN ANALYZE**

```sql
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
```

---

### ⚠️ **Possible Inefficiencies**

For a medium/large dataset, observations:

| Symptom                               | Meaning                        | Solution                                                     |
| ------------------------------------- | ------------------------------ | ------------------------------------------------------------ |
| `Seq Scan on bookings`                | Full table scan                | Add `INDEX ON bookings(user_id)` and `bookings(property_id)` |
| `Nested Loop Join` with high cost     | Inefficient join               | Consider `HASH JOIN` or ensure indexed fields are used       |
| `Rows Removed by Filter` is high      | Many unnecessary rows scanned  | Filter earlier or optimize join conditions                   |
| `Left Join` on payments causing delay | Nullable join with large table | Consider materialized views or avoid unless needed           |

---

### ✅ **Suggested Indexes**

```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
```

These indexes help PostgreSQL/MySQL switch from **Sequential Scan** to **Index Scan**, significantly reducing the time.

-------------------
Here is a **refactored version** of the original query designed to optimize performance while maintaining all essential data:

### ✅ **Refactored Query: Optimized for Performance**

```sql
-- Optimized query using selective fields and indexes
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pay.amount,
    pay.payment_method
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
```

---

### 💡 **What Changed and Why**

| Change                                                                         | Reason                                     |
| ------------------------------------------------------------------------------ | ------------------------------------------ |
| Removed unused fields (e.g., `pay.payment_date`, full `u.user_id`)             | Reduces I/O and memory usage               |
| Left join on `payments` remains                                                | Preserves optional payment data            |
| Assumes indexes exist on foreign keys (`user_id`, `property_id`, `booking_id`) | Ensures `Index Scan` instead of `Seq Scan` |

---

### 🔧 **Ensure These Indexes Exist**

```sql
-- Improves JOIN and WHERE clause performance
CREATE INDEX IF NOT EXISTS idx_bookings_user_id ON bookings(user_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);
```

---


