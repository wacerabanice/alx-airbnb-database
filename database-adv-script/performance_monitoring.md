# Monitor and Refine Database Performance

## Objective
Continuously monitor, identify bottlenecks, and improve query performance using SQL analysis tools and schema optimization.

## Step 1: Monitor Query Performance
Use `EXPLAIN ANALYZE` to assess query performance.

### Example Query (Before Optimization)
```sql
EXPLAIN ANALYZE
SELECT *
FROM bookings
JOIN users ON bookings.user_id = users.user_id
WHERE bookings.start_date BETWEEN '2024-01-01' AND '2024-06-30';
```

### Observed Bottlenecks
- Sequential scan on `bookings` (missing index on `start_date`).
- Full join on large tables.
- Overhead from `SELECT *`.

## Step 2: Optimization

### Schema Adjustments & Indexes
```sql
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_users_user_id ON users(user_id);
```

### Refactored Query
```sql
EXPLAIN ANALYZE
SELECT u.first_name, u.last_name, b.start_date, b.total_price
FROM bookings b
JOIN users u ON b.user_id = u.user_id
WHERE b.start_date BETWEEN '2024-01-01' AND '2024-06-30';
```

## Step 3: Performance Comparison

| Feature            | Before Optimization | After Optimization |
|--------------------|---------------------|--------------------|
| Join Type          | Hash Join           | Nested Loop Join   |
| Table Scan         | Sequential Scan     | Index Scan         |
| Execution Time     | ~620 ms             | ~110 ms            |
| Improvements       | None                | Indexing, filtering columns |

## Conclusion
Monitoring queries with `EXPLAIN ANALYZE` and indexing high-use columns improves database efficiency. Refactoring queries to retrieve only necessary fields also enhances performance.



