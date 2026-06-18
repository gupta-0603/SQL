# Comprehensive SQL Learning & Database Hub 🗄️

Welcome to my SQL learning repository! This repository serves as a centralized hub documenting my journey through relational database management systems (RDBMS), structured query tracking, and data analysis optimization. It contains structured notes, hands-on query practices, and problem-solving tracking across fundamental to advanced SQL topics.

## 📌 Repository Roadmap & Topics Covered

### 1. Basic Foundations & Data Definition Language (DDL)
- **Database Operations:** Creating, altering, and dropping databases and tables (`CREATE`, `ALTER`, `DROP`, `TRUNCATE`).
- **Data Integrity:** Implementing Primary Keys, Foreign Keys, Unique, Not Null, and Check Constraints.

### 2. Data Manipulation Language (DML) & Basic Querying
- **CRUD Operations:** Inserting records, updating values, and deleting entries cleanly (`INSERT`, `UPDATE`, `DELETE`).
- **Filtering & Sorting:** Using `WHERE` clauses, logical operators (`AND`, `OR`, `NOT`), `IN`, `BETWEEN`, `LIKE` wildcards, and sorting data via `ORDER BY`.

### 3. Aggregations & Data Summarization
- **Aggregate Functions:** Summarizing data distributions using `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`.
- **Group Filtering:** Partitioning results with `GROUP BY` and applying post-aggregation filters using the `HAVING` clause.

### 4. Relational Data Merging (Joins)
- **Primary Combinations:** Connecting datasets using `INNER JOIN`, `LEFT (OUTER) JOIN`, `RIGHT (OUTER) JOIN`, and `FULL JOIN`.
- **Advanced Joins:** Managing hierarchical data models using `SELF JOIN` and combinatorial pairs using `CROSS JOIN`.

### 5. Intermediate & Advanced Query Mechanisms
- **Subqueries & Nesting:** Writing independent and correlated subqueries within `SELECT`, `FROM`, and `WHERE` conditions.
- **Common Table Expressions (CTEs):** Simplifying deep nesting configurations using readable `WITH` statements.
- **Window Functions:** Performing advanced running calculations, analytical partitions, and rankings using `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LEAD()`, and `LAG()`.

### 6. Database Performance & Objects
- **Views:** Encapsulating complex analytical strings into reusable virtual tables.
- **Indexing:** Boosting query execution speeds using clustered and non-clustered indexing techniques.

---

## 🛠️ Tech Stack & Flavors Covered
- **Primary Engines:** MySQL / PostgreSQL / Microsoft SQL Server *(Modify based on what you used)*
- **Interface Tools:** Command Line Interface (CLI), Workbench / pgAdmin / DBeaver

---

## 📂 Folder Architecture Strategy
To keep this repository clean, files are grouped logically by topic:
```text
├── 01_DDL_and_Basics/       # Table creation scripts, data types, and structural changes
├── 02_DML_and_Filtering/    # Data insertion, conditional filtering, and ordering scripts
├── 03_Aggregations/         # Group By, Having, and statistical summaries
├── 04_Joins/                # Inner, Left, Right, and complex hierarchical Self-Joins
├── 05_Advanced_SQL/         # Window Functions, Subqueries, and complex CTEs
└── README.md                # This root directory roadmap
