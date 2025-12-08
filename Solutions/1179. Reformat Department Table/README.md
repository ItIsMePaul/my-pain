# 1179. Reformat Department Table

**Difficulty:** Easy  
**Language:** PostgreSQL  
**Performance:** Runtime 362ms (Beats 76.20%), Memory 0.00 MB (Beats 100.00%)

Solved December 6, 2025.

---

## Problem Statement

Given a `Department` table with monthly revenue data, reformat it so that each department has one row with columns for each month's revenue.

**Table: Department**

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| revenue     | int     |
| month       | varchar |
+-------------+---------+
```

- `(id, month)` is the primary key
- Each row contains a department's revenue for a specific month
- `month` values: ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]

**Task:** Transform the table from **long format** (multiple rows per department) to **wide format** (one row per department with 12 revenue columns).

**Example:**

**Input:**

```
Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+
```

**Output:**

```
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+
```

**Note:** Result table has 13 columns (1 for id + 12 for months). Months without revenue show NULL.

---

## Approach

### The Challenge

This is a classic **pivot operation** - transforming rows into columns.

**Long format (input):**

```
id=1, month='Jan', revenue=8000
id=1, month='Feb', revenue=7000
id=1, month='Mar', revenue=6000
```

**Wide format (output):**

```
id=1, Jan_Revenue=8000, Feb_Revenue=7000, Mar_Revenue=6000, ...
```

PostgreSQL doesn't have a built-in PIVOT keyword, so we construct it using **conditional aggregation**.

### The Solution: CASE + SUM Pattern

**Strategy:**

1. Use CASE to create conditional expressions for each month
2. SUM aggregates the values per department
3. GROUP BY consolidates rows by id
4. Missing months return NULL automatically

**The key insight:** `CASE` without `ELSE` returns NULL by default.

---

## Visual Flow

![Pivot Operation Flow](./diagrams/reformat_dept_table_flow.jpg)

The diagram shows:

1. Input table in long format (multiple rows per department)
2. CASE expressions checking each month condition
3. SUM aggregation grouping by department id
4. Output table in wide format (one row per department)
5. NULL handling for missing months

---

## Solution

```sql
SELECT
    id,
    SUM(CASE WHEN month = 'Jan' THEN revenue END) AS "Jan_Revenue",
    SUM(CASE WHEN month = 'Feb' THEN revenue END) AS "Feb_Revenue",
    SUM(CASE WHEN month = 'Mar' THEN revenue END) AS "Mar_Revenue",
    SUM(CASE WHEN month = 'Apr' THEN revenue END) AS "Apr_Revenue",
    SUM(CASE WHEN month = 'May' THEN revenue END) AS "May_Revenue",
    SUM(CASE WHEN month = 'Jun' THEN revenue END) AS "Jun_Revenue",
    SUM(CASE WHEN month = 'Jul' THEN revenue END) AS "Jul_Revenue",
    SUM(CASE WHEN month = 'Aug' THEN revenue END) AS "Aug_Revenue",
    SUM(CASE WHEN month = 'Sep' THEN revenue END) AS "Sep_Revenue",
    SUM(CASE WHEN month = 'Oct' THEN revenue END) AS "Oct_Revenue",
    SUM(CASE WHEN month = 'Nov' THEN revenue END) AS "Nov_Revenue",
    SUM(CASE WHEN month = 'Dec' THEN revenue END) AS "Dec_Revenue"
FROM
    Department
GROUP BY
    id
ORDER BY
    id;
```

**Clean, efficient, and idiomatic SQL.**

### How It Works

**Each CASE expression:**

```sql
CASE WHEN month = 'Jan' THEN revenue END
```

**What happens:**

- If `month = 'Jan'`, return the revenue value
- If `month ≠ 'Jan'`, return NULL (no ELSE clause)

**The SUM aggregation:**

```sql
SUM(CASE WHEN month = 'Jan' THEN revenue END)
```

**What happens:**

- Aggregates all values for this department
- NULL values are ignored by SUM
- If all values are NULL, SUM returns NULL (not 0!)

**The GROUP BY:**

```sql
GROUP BY id
```

**What happens:**

- Combines all rows for the same department
- Each CASE/SUM produces one value per department
- Result: one row per department with 12 revenue columns

---

## Complexity Analysis

**Time Complexity: O(n)**

- Single scan through the Department table
- 12 CASE evaluations per row (constant)
- GROUP BY aggregation: O(n)

**Space Complexity: O(d)**

- Where d = number of distinct departments
- Result set has one row per department
- No additional temporary structures

**Why 76.20% faster:**

- Single table scan (not 12 scans)
- No JOIN overhead
- Efficient GROUP BY aggregation
- Simple execution plan

---

## The CASE Without ELSE Trick

### The Critical Detail

```sql
-- ❌ Common mistake:
SUM(CASE WHEN month = 'Jan' THEN revenue ELSE 0 END)
-- Returns 0 for missing months (wrong!)

-- ✅ Correct approach:
SUM(CASE WHEN month = 'Jan' THEN revenue END)
-- Returns NULL for missing months (right!)
```

### Why This Matters

**With ELSE 0:**

```
Department 1 has no Mar revenue
CASE returns 0 for Mar
SUM(0) = 0
Output: Mar_Revenue = 0  ❌ (wrong!)
```

**Without ELSE (implicit NULL):**

```
Department 1 has no Mar revenue
CASE returns NULL for Mar
SUM(NULL) = NULL
Output: Mar_Revenue = NULL  ✓ (correct!)
```

### SQL NULL Aggregation Rules

**Important to remember:**

- `SUM(NULL)` → NULL
- `SUM(8000, NULL)` → 8000 (NULL ignored)
- `SUM(0)` → 0
- `SUM(8000, 0)` → 8000

**The difference between NULL and 0:**

- NULL means "no data" / "unknown"
- 0 means "zero revenue"
- They're semantically different!

---

## Walk-Through

### Example: Complete Execution

```sql
Input:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 1    | 7000    | Feb   |
| 2    | 9000    | Jan   |
+------+---------+-------+

Step 1: Evaluate CASE for each row

Row 1 (id=1, revenue=8000, month=Jan):
  Jan: CASE WHEN 'Jan'='Jan' THEN 8000 END → 8000
  Feb: CASE WHEN 'Jan'='Feb' THEN 8000 END → NULL
  Mar: CASE WHEN 'Jan'='Mar' THEN 8000 END → NULL
  ... (all other months return NULL)

Row 2 (id=1, revenue=7000, month=Feb):
  Jan: CASE WHEN 'Feb'='Jan' THEN 7000 END → NULL
  Feb: CASE WHEN 'Feb'='Feb' THEN 7000 END → 7000
  Mar: CASE WHEN 'Feb'='Mar' THEN 7000 END → NULL
  ... (all other months return NULL)

Row 3 (id=2, revenue=9000, month=Jan):
  Jan: CASE WHEN 'Jan'='Jan' THEN 9000 END → 9000
  Feb: CASE WHEN 'Jan'='Feb' THEN 9000 END → NULL
  Mar: CASE WHEN 'Jan'='Mar' THEN 9000 END → NULL
  ... (all other months return NULL)

Step 2: GROUP BY id and SUM

Department 1:
  Jan_Revenue: SUM(8000, NULL) = 8000
  Feb_Revenue: SUM(NULL, 7000) = 7000
  Mar_Revenue: SUM(NULL, NULL) = NULL
  ... (all other months = NULL)

Department 2:
  Jan_Revenue: SUM(9000) = 9000
  Feb_Revenue: SUM(NULL) = NULL
  Mar_Revenue: SUM(NULL) = NULL
  ... (all other months = NULL)

Output:
+------+-------------+-------------+-------------+-----+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... |
+------+-------------+-------------+-------------+-----+
| 1    | 8000        | 7000        | NULL        | ... |
| 2    | 9000        | NULL        | NULL        | ... |
+------+-------------+-------------+-------------+-----+
```

### Example: NULL vs 0 Demonstration

```sql
-- Test case showing the difference

Input:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 5000    | Jan   |
+------+---------+-------+

Using ELSE 0 (WRONG):
SELECT
    id,
    SUM(CASE WHEN month='Jan' THEN revenue ELSE 0 END) AS Jan_Revenue,
    SUM(CASE WHEN month='Feb' THEN revenue ELSE 0 END) AS Feb_Revenue
FROM Department
GROUP BY id;

Output:
+------+-------------+-------------+
| id   | Jan_Revenue | Feb_Revenue |
+------+-------------+-------------+
| 1    | 5000        | 0           |  ❌ Should be NULL!
+------+-------------+-------------+

Using no ELSE (CORRECT):
SELECT
    id,
    SUM(CASE WHEN month='Jan' THEN revenue END) AS Jan_Revenue,
    SUM(CASE WHEN month='Feb' THEN revenue END) AS Feb_Revenue
FROM Department
GROUP BY id;

Output:
+------+-------------+-------------+
| id   | Jan_Revenue | Feb_Revenue |
+------+-------------+-------------+
| 1    | 5000        | NULL        |  ✓ Correct!
+------+-------------+-------------+
```

---

## Key Insights

### Conditional Aggregation Pattern

This is the **standard SQL pivot technique**:

```sql
SUM(CASE WHEN condition THEN value END)
```

**Used for:**

- Pivoting rows to columns
- Creating cross-tabulations
- Conditional summations
- Data reshaping

**Alternatives you might see:**

```sql
-- Using MAX instead of SUM (works if only one value per group)
MAX(CASE WHEN month='Jan' THEN revenue END)

-- Using COUNT for presence checks
COUNT(CASE WHEN condition THEN 1 END)

-- Using AVG for averages
AVG(CASE WHEN condition THEN value END)
```

### Why SUM Works Here

**Each department has at most one row per month** (per primary key constraint).

So for each department+month combination:

- Either: one revenue value (SUM returns that value)
- Or: no value (all CASEs return NULL, SUM returns NULL)

SUM effectively acts as a "pick the value if it exists" function.

### The GROUP BY Necessity

```sql
GROUP BY id
```

**Without GROUP BY:**

- Query would return all rows collapsed into one
- You'd get one total row for all departments combined

**With GROUP BY:**

- Query returns one row per distinct id
- Aggregation happens within each group

---

---

## What I Learned

**CASE without ELSE returns NULL.** This is the key to proper pivot operations.

**SUM ignores NULL values.** `SUM(8000, NULL, NULL)` = 8000, not 8000+0+0.

**NULL ≠ 0 semantically.** NULL means "no data", 0 means "zero value".

**Conditional aggregation is powerful.** The CASE+SUM pattern solves many data reshaping problems.

**GROUP BY is essential for pivoting.** Without it, you can't aggregate per group.

**Standard SQL patterns are portable.** CASE works everywhere, proprietary syntax doesn't.

---

_Solved December 6, 2025_  
_Runtime: 362ms (76.20%)_  
_Memory: 0.00 MB (100.00%)_  
_Problem #1,018_  
_Streak: 271 days_  
_PostgreSQL: 61 problems_

[← Back to Solutions](../../) | [LeetCode](https://leetcode.com/problems/reformat-department-table/)
