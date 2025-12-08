# 3451. Find Invalid IP Addresses

**Difficulty:** Hard  
**Language:** PostgreSQL  
**Performance:** Runtime 177ms (Beats 49.81%), Memory 0.00 MB (Beats 100.00%)

Solved December 7, 2025.

---

## Problem Statement

Given a `logs` table containing server access logs with IP addresses, find all invalid IP addresses and count their occurrences.

**Table: logs**

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| log_id      | int     |
| ip          | varchar |
| status_code | int     |
+-------------+---------+
```

- `log_id` is the unique key
- Each row contains an IP address and HTTP status code

**Invalid IP Address Rules:**

An IPv4 address is **invalid** if it meets ANY of these conditions:

1. Has less or more than 4 octets (parts separated by dots)
2. Contains numbers greater than 255 in any octet
3. Has leading zeros in any octet (like `192.168.001.1`)

Return the count of occurrences for each invalid IP, ordered by `invalid_count DESC, ip DESC`.

**Example:**

**Input:**

```
logs table:
+--------+---------------+-------------+
| log_id | ip            | status_code |
+--------+---------------+-------------+
| 1      | 192.168.1.1   | 200         |
| 2      | 256.1.2.3     | 404         |
| 3      | 192.168.001.1 | 200         |
| 4      | 192.168.1.1   | 200         |
| 5      | 192.168.1     | 500         |
| 6      | 256.1.2.3     | 404         |
| 7      | 192.168.001.1 | 200         |
+--------+---------------+-------------+
```

**Output:**

```
+---------------+---------------+
| ip            | invalid_count |
+---------------+---------------+
| 192.168.001.1 | 2             |
| 256.1.2.3     | 2             |
| 192.168.1     | 1             |
+---------------+---------------+
```

**Explanation:**

- `256.1.2.3`: Invalid (256 > 255)
- `192.168.001.1`: Invalid (leading zero in "001")
- `192.168.1`: Invalid (only 3 octets, needs 4)
- `192.168.1.1`: Valid (all rules satisfied)

---

## Approach

### The Challenge

IP validation requires checking multiple conditions:

- Correct number of parts (exactly 4)
- Each part is 0-255
- No leading zeros (except "0" itself)

We need to parse the IP string and validate each octet.

### The Solution: Array-Based Validation

**Strategy:**

1. Parse IP address into array using `STRING_TO_ARRAY(ip, '.')`
2. Check array length (must be exactly 4)
3. Check each octet for leading zeros using regex
4. Cast to integers and validate range (0-255)
5. Group by IP and count occurrences

**Key PostgreSQL techniques:**

- Array manipulation with `STRING_TO_ARRAY`
- Array indexing: `array[1]`, `array[2]`, etc.
- Regex matching for leading zeros
- Type casting arrays: `(array::int[])[index]`

---

## Visual Flow

![IP Validation Flow](./diagrams/find_invalid_ips_flow.jpg)

The diagram shows:

1. Input logs with various IP formats
2. Parsing IPs into arrays
3. Validation checks (length, leading zeros, range)
4. Grouping and counting invalid IPs
5. Sorted output by count and IP

---

## Solution

```sql
WITH parsed_ips AS (
    SELECT
        ip,
        status_code,
        STRING_TO_ARRAY(ip, '.') AS ip_array
    FROM logs
)
SELECT
    ip,
    COUNT(ip) AS invalid_count
FROM parsed_ips
WHERE
    -- Check 1: Must have exactly 4 octets
    NOT array_length(ip_array, 1) = 4

    -- Check 2: No leading zeros (01, 001, etc.)
    OR ip_array[1] ~ '^0[0-9]'
    OR ip_array[2] ~ '^0[0-9]'
    OR ip_array[3] ~ '^0[0-9]'
    OR ip_array[4] ~ '^0[0-9]'

    -- Check 3: Each octet must be 0-255
    OR (ip_array::int[])[1] NOT BETWEEN 0 AND 255
    OR (ip_array::int[])[2] NOT BETWEEN 0 AND 255
    OR (ip_array::int[])[3] NOT BETWEEN 0 AND 255
    OR (ip_array::int[])[4] NOT BETWEEN 0 AND 255
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;
```

---

## Complexity Analysis

**Time Complexity: O(n)**

- Parse each IP: O(n)
- Validate each: O(1) per IP
- GROUP BY: O(n)

**Space Complexity: O(n)**

- CTE stores parsed arrays
- Result stores unique invalid IPs

---

## Key PostgreSQL Syntax

### Array Creation

```sql
STRING_TO_ARRAY('192.168.1.1', '.')
-- Result: {'192', '168', '1', '1'}
```

**Important:** Returns text array, not integer array.

### Array Indexing

```sql
-- Store in variable first (your approach):
ip_array AS ip_array
ip_array[1]  -- Access first element

-- Direct indexing needs parentheses:
(STRING_TO_ARRAY(ip, '.'))[1]
```

### Array Casting

```sql
-- Cast entire array to int[], then index:
(ip_array::int[])[1]

-- This converts '192' → 192 as integer
```

**Common mistake:** `ip_array::int[1]` doesn't work (wrong syntax).

### Regex for Leading Zeros

```sql
ip_array[1] ~ '^0[0-9]'
```

**Pattern:** `^0[0-9]`

- `^` - Start of string
- `0` - Literal zero
- `[0-9]` - Followed by another digit

**Matches:** `01`, `02`, `001`, `099`  
**Doesn't match:** `0` (single zero is valid), `10`, `100`

---

## Walk-Through

### Example: Validation Process

```sql
Input: ip = '192.168.001.1'

Step 1: Parse to array
STRING_TO_ARRAY('192.168.001.1', '.')
→ {'192', '168', '001', '1'}

Step 2: Check length
array_length(ip_array, 1) = 4 ✓

Step 3: Check leading zeros
ip_array[1] = '192' ~ '^0[0-9]' → false ✓
ip_array[2] = '168' ~ '^0[0-9]' → false ✓
ip_array[3] = '001' ~ '^0[0-9]' → TRUE ✗
INVALID (leading zero detected)

Result: Invalid IP
```

### Example: Range Validation

```sql
Input: ip = '256.1.2.3'

Step 1: Parse to array
STRING_TO_ARRAY('256.1.2.3', '.')
→ {'256', '1', '2', '3'}

Step 2: Cast and check ranges
(ip_array::int[])[1] = 256
256 BETWEEN 0 AND 255 → FALSE ✗
INVALID (out of range)

Result: Invalid IP
```

### Example: Wrong Octet Count

```sql
Input: ip = '192.168.1'

Step 1: Parse to array
STRING_TO_ARRAY('192.168.1', '.')
→ {'192', '168', '1'}

Step 2: Check length
array_length(ip_array, 1) = 3
NOT equal to 4 ✗
INVALID (too few octets)

Result: Invalid IP
```

---

## What I Learned

**PostgreSQL array indexing uses brackets:** `array[1]`, not `array(1)`.

**Array casting syntax matters:** `(array::int[])[index]`, not `array::int[index]`.

**Regex is powerful for pattern matching:** `^0[0-9]` catches leading zeros.

**CTEs make complex queries readable:** Parse once, use multiple times.

**BETWEEN is inclusive:** `x BETWEEN 0 AND 255` includes both 0 and 255.

---

_Solved December 7, 2025_  
_Runtime: 177ms (49.81%)_  
_Memory: 0.00 MB (100.00%)_  
_Problem #1,019_  
_Streak: 272 days_  
_PostgreSQL: 62 problems_

[← Back to Solutions](../../) | [LeetCode](https://leetcode.com/problems/find-invalid-ip-addresses/)
