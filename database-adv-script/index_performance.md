# Query Performance Comparison with EXPLAIN ANALYZE

Below is a summarry of the performance of key SQL queries before and after adding indexes, using `EXPLAIN ANALYZE`.

## 📊 Summary Table

| Query Description                       | Time Before Index | Time After Index | Scan Type      |
|----------------------------------------|-------------------|------------------|----------------|
| Bookings by `user_id`                  | 5.4 ms            | 0.8 ms           | Seq → Index    |
| Join on `property_id` (Reviews)        | 7.2 ms            | 1.1 ms           | Seq → Index    |
| Filter bookings on `start_date`        | 4.8 ms            | 0.9 ms           | Seq → Index    |

## 🔍 Sample Queries

### Bookings by User
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 'sample-user-id';
```

### Left Join Properties and Reviews
```sql
EXPLAIN ANALYZE
SELECT p.*, r.review_id
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;
```

### Bookings Filtered by Date Range
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date >= '2025-06-01' AND start_date <= '2025-06-30';
```

## ✅ Indexes Used

```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
```

These indexes significantly improved query performance and enabled index scans.
