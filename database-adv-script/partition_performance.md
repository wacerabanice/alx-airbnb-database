📊 Brief Report on Notable and General Improvements after partitioning:
- Query targeting a specific date range (e.g., bookings in June 2024) will only scan the relevant partition (bookings_2024) instead of the entire table.
- This significantly reduces I/O and improves performance, especially for large datasets.
- **Partition pruning**: Queries with filters (e.g., on `start_date`) only scan relevant partitions instead of the entire table.
- Results in **fewer disk reads**, **lower latency**, and better use of indexes.
- Partitions can be **organized logically**, such as by year or region.
- Helps isolate recent or frequently accessed data from older, less used records.
- You can **drop**, **archive**, or **truncate** a single partition (e.g., all bookings from 2023) without affecting the rest of the data.
- Simplifies **data purging**, retention policies, and historical data management.
- Indexes are **smaller and faster** within each partition.
- Reduces memory and storage consumption while improving lookup speed.
- As data grows, partitioning makes it easier to **scale horizontally**.
- You can move or replicate partitions independently in distributed systems.



