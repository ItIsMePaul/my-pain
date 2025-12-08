# 3436. Find Valid Emails

**Difficulty:** Easy  
**Language:** PostgreSQL  
**Performance:** Runtime 168ms (Beats 97.52%), Memory 0.00 MB (Beats 100.00%)

Solved December 5, 2025.

---

## Problem Statement

Given a `Users` table, find all users with **valid email addresses**.

**Table: Users**

```
+---------+---------+
| Column  | Type    |
+---------+---------+
| user_id | int     |
| email   | varchar |
+---------+---------+
```

- `user_id` is the primary key
- Each row contains a user's ID and email address

**Email Validation Rules:**

A valid email must satisfy **ALL** of the following:

1. Contains **exactly one** `@` symbol
2. Ends with `.com`
3. Part **before** `@`: Only alphanumeric characters (a-z, A-Z, 0-9) and underscores (`_`)
4. Part **after** `@` and before `.com`: Only letters (a-z, A-Z), no numbers or special characters

Return results ordered by `user_id` ascending.

**Example:**

**Input:**

```
Users table:
+---------+---------------------+
| user_id | email               |
+---------+---------------------+
| 1       | alice@example.com   |
| 2       | bob_at_example.com  |
| 3       | charlie@example.net |
| 4       | david@domain.com    |
| 5       | eve@invalid         |
+---------+---------------------+
```

**Output:**

```
+---------+-------------------+
| user_id | email             |
+---------+-------------------+
| 1       | alice@example.com |
| 4       | david@domain.com  |
+---------+-------------------+
```

**Explanation:**

- `OK` `alice@example.com` - Valid (alphanumeric username, letter-only domain, ends .com)
- `not OK` `bob_at_example.com` - Invalid (no @ symbol)
- `not OK` `charlie@example.net` - Invalid (ends with .net, not .com)
- `OK` `david@domain.com` - Valid (meets all criteria)
- `not OK` `eve@invalid` - Invalid (doesn't end with .com)

---

## Approach

### The Challenge

Email validation requires checking multiple conditions:

- Pattern structure (username@domain.com)
- Character restrictions (different for username vs domain)
- Specific ending (.com only)

We need a way to express all these rules concisely.

### The Solution: Regular Expression

PostgreSQL's `~` operator provides regex pattern matching. We can encode all validation rules into a single pattern:

```
^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$
```

**Pattern breakdown:**

| Part            | Meaning                                             |
| --------------- | --------------------------------------------------- |
| `^`             | Start of string (no leading characters)             |
| `[a-zA-Z0-9_]+` | Username: letters, digits, underscore (1 or more)   |
| `@`             | Literal @ symbol (exactly one)                      |
| `[a-zA-Z]+`     | Domain: only letters (1 or more)                    |
| `\.`            | Literal dot (escaped because . is special in regex) |
| `com`           | Literal "com"                                       |
| `$`             | End of string (no trailing characters)              |

**Why this works:**

- `^` and `$` ensure the ENTIRE string matches (no extra characters)
- `+` quantifier ensures each part has at least one character
- Character classes `[...]` define exactly what's allowed
- No backtracking or optional parts (efficient matching)

---

## Visual Flow

![Email Validation Flow](./diagrams/find_valid_emails_flow.jpg)

The diagram shows:

1. Input table with various email formats
2. Regex pattern breakdown for each component
3. Validation process checking each part
4. Filtered results with only valid emails
5. Final sorted output by user_id

---

## Solution

```sql
SELECT
    user_id,
    email
FROM
    Users
WHERE
    email ~ '^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$'
ORDER BY
    user_id ASC;
```

**That's it.** One pattern, one line, perfect validation.

### Why This Query Works

**The `~` operator:**

- PostgreSQL's regex match operator
- Returns true if string matches pattern
- Case-sensitive by default
- Compiled and optimized for performance

**The ORDER BY:**

- Results must be sorted by user_id ascending
- Simple `ORDER BY user_id ASC` handles it

**No explicit filtering needed:**

- All validation logic is in the regex pattern
- Database engine handles the matching efficiently

---

## Complexity Analysis

**Time Complexity: O(n × m)**

- n = number of rows in Users table
- m = average length of email strings
- Each email is scanned once by the regex engine
- Modern regex engines are highly optimized

**Space Complexity: O(1)**

- No temporary tables or storage
- Results are streamed directly
- ORDER BY uses built-in sorting (O(k log k) where k = result size)

**Why 97.52% faster:**

- Simple pattern with no backtracking
- No string manipulation functions needed
- Database-native regex is compiled and optimized
- Single pass through the data

---

## Pattern Validation Examples

### Valid Emails

```
a@b.com                    Username: "a", Domain: "b"
john123@example.com        Username: "john123", Domain: "example"
user_name@domain.com       Username: "user_name", Domain: "domain"
A_1_B@XYZ.com             Username: "A_1_B", Domain: "XYZ"
___@abc.com               Username: "___", Domain: "abc"
```

**Why valid:**

- All have exactly one @
- Username has only [a-zA-Z0-9_]
- Domain has only [a-zA-Z]
- All end with .com

### Invalid Emails

```
john@leet-code.com         Domain has hyphen (-)
user@123domain.com         Domain has numbers
@domain.com                Empty username
user@.com                  Empty domain
user@domain                Missing .com
user@domain.net            Wrong TLD (.net not .com)
user.name@domain.com       Dot (.) in username (not allowed)
user+tag@domain.com        Plus (+) in username (not allowed)
user@sub.domain.com        Multiple dots (subdomain)
```

**Common mistakes:**

- Special characters in username (., +, -, %)
- Numbers or symbols in domain
- Wrong top-level domain (.net, .org, .edu)
- Subdomains (foo.bar.com)

---

## Walk-Through

### Example 1: Full Test Case

```sql
Input:
+---------+---------------------+
| user_id | email               |
+---------+---------------------+
| 1       | alice@example.com   |
| 2       | bob_at_example.com  |
| 3       | charlie@example.net |
| 4       | david@domain.com    |
| 5       | eve@invalid         |
+---------+---------------------+

Validation:
user_id=1: alice@example.com
  Match: ^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$
  Username "alice" matches [a-zA-Z0-9_]+ ✓
  Has @ ✓
  Domain "example" matches [a-zA-Z]+ ✓
  Ends with .com ✓
  VALID

user_id=2: bob_at_example.com
  Match: ^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$
  String "bob_at_example.com" has no @ symbol
  Pattern requires @ after [a-zA-Z0-9_]+
  INVALID

user_id=3: charlie@example.net
  Match: ^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$
  Username "charlie" matches [a-zA-Z0-9_]+ ✓
  Has @ ✓
  Domain "example" matches [a-zA-Z]+ ✓
  Ends with .net (pattern requires .com)
  INVALID

user_id=4: david@domain.com
  Match: ^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$
  Username "david" matches [a-zA-Z0-9_]+ ✓
  Has @ ✓
  Domain "domain" matches [a-zA-Z]+ ✓
  Ends with .com ✓
  VALID

user_id=5: eve@invalid
  Match: ^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$
  Username "eve" matches [a-zA-Z0-9_]+ ✓
  Has @ ✓
  Domain "invalid" matches [a-zA-Z]+ ✓
  Ends with nothing (pattern requires .com)
  INVALID

Output (sorted by user_id):
+---------+-------------------+
| user_id | email             |
+---------+-------------------+
| 1       | alice@example.com |
| 4       | david@domain.com  |
+---------+-------------------+
```

### Example 2: Edge Cases

```sql
Input:
+---------+---------------------+
| user_id | email               |
+---------+---------------------+
| 1       | a@b.com             |
| 2       | @domain.com         |
| 3       | user@.com           |
| 4       | user@domain         |
+---------+---------------------+

Validation:
user_id=1: a@b.com
  Username "a" (1 char) matches [a-zA-Z0-9_]+ ✓
  Domain "b" (1 char) matches [a-zA-Z]+ ✓
  VALID

user_id=2: @domain.com
  Pattern starts with [a-zA-Z0-9_]+
  String starts with @ (no username)
  INVALID

user_id=3: user@.com
  Username "user" matches [a-zA-Z0-9_]+ ✓
  After @, expects [a-zA-Z]+
  String has immediate dot (empty domain)
  INVALID

user_id=4: user@domain
  Username "user" matches [a-zA-Z0-9_]+ ✓
  Domain "domain" matches [a-zA-Z]+ ✓
  Pattern requires \.com after domain
  String ends at "domain" (no .com)
  INVALID

Output:
+---------+---------+
| user_id | email   |
+---------+---------+
| 1       | a@b.com |
+---------+---------+
```

---

## Regular Expression Breakdown

### Character Classes

```regex
[a-zA-Z0-9_]    Alphanumeric + underscore
[a-zA-Z]        Letters only (both cases)
```

**Why separate classes:**

- Username allows more characters (including digits and \_)
- Domain is stricter (letters only)
- Different rules = different character classes

### Quantifiers

```regex
+               One or more (at least 1)
```

**Why `+` not `*`:**

- `*` means "zero or more" (allows empty)
- `+` means "one or more" (requires at least one)
- Empty username or domain would be invalid

### Anchors

```regex
^               Start of string
$               End of string
```

**Why both anchors:**

- Without `^`: "xyzalice@example.com" would match (trailing)
- Without `$`: "alice@example.comxyz" would match (leading)
- Together: exact match required

### Escaping

```regex
\.              Literal dot (escaped)
```

**Why escape the dot:**

- `.` in regex means "any character"
- `\.` means literal dot character
- Must escape to match actual dot in .com

---

## Alternative Approaches

### Using LIKE Pattern

```sql
WHERE email LIKE '%@%.com'
  AND email NOT LIKE '%-%'
  AND email NOT LIKE '%.%@%'
```

**Problems:**

- `%` is too permissive (matches anything)
- Multiple LIKE conditions are slow
- Can't enforce "letters only in domain"
- **Your regex is better**

### Using String Functions

```sql
WHERE POSITION('@' IN email) > 0
  AND POSITION('@' IN email) = LENGTH(email) - POSITION('@' IN REVERSE(email)) + 1
  AND RIGHT(email, 4) = '.com'
  AND SUBSTRING(email FROM POSITION('@' IN email) + 1 FOR LENGTH(email) - POSITION('@' IN email) - 4) ~ '^[a-zA-Z]+$'
```

**Problems:**

- Extremely verbose
- Multiple function calls (slow)
- Hard to read and maintain
- **Your regex is much cleaner**

### Using REGEXP_MATCH (More Verbose)

```sql
WHERE REGEXP_MATCH(email, '^[a-zA-Z0-9_]+@[a-zA-Z]+\.com$') IS NOT NULL
```

**Comparison:**

- `~` is shorthand for regexp match
- REGEXP_MATCH returns array (need IS NOT NULL)
- **Your `~` operator is more concise**

**Winner:** Your solution with `~` operator

---

## PostgreSQL Regex Operators

PostgreSQL provides several regex operators:

| Operator | Meaning                           | Example               |
| -------- | --------------------------------- | --------------------- |
| `~`      | Matches (case-sensitive)          | `email ~ '^[a-z]+@'`  |
| `~*`     | Matches (case-insensitive)        | `email ~* '^[A-Z]+@'` |
| `!~`     | Does not match (case-sensitive)   | `email !~ '@test'`    |
| `!~*`    | Does not match (case-insensitive) | `email !~* '@TEST'`   |

**Your choice (`~`):**

- Case-sensitive matching
- Allows both uppercase and lowercase (via [a-zA-Z])
- Most explicit and clear

---

## What I Learned

**Regular expressions are powerful for validation.** One pattern can express complex rules clearly.

**PostgreSQL's `~` operator is underrated.** Clean syntax, high performance.

**Anchors are critical.** `^` and `$` ensure exact matches, not substring matches.

**Character classes are precise.** `[a-zA-Z0-9_]` is explicit about what's allowed.

**Database regex is optimized.** PostgreSQL compiles regex patterns for efficient matching.

**Simple patterns perform best.** No backtracking, no lookahead, just straightforward matching.

---

## Fun Fact

Your solution **beats 97.52%** of submissions with just **168ms runtime**.

The pattern is so simple that PostgreSQL's regex engine can evaluate it extremely efficiently. This is the power of choosing the right tool (regex) for the right problem (validation).

---

_Solved December 5, 2025_  
_Runtime: 168ms (97.52%)_  
_Memory: 0.00 MB (100.00%)_  
_Problem #1,016_  
_Streak: 270 days_

[← Back to Solutions](../../) | [LeetCode](https://leetcode.com/problems/find-valid-emails/)
