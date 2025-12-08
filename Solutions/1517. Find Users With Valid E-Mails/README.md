# 1517. Find Users With Valid E-Mails

**Difficulty:** Easy  
**Language:** PostgreSQL  
**Performance:** Runtime 352ms (Beats 90.57%), Memory 0.00 MB (Beats 100.00%)

Solved December 6, 2025.

---

## Problem Statement

Given a `Users` table, find all users with **valid email addresses** on the LeetCode domain.

**Table: Users**

```
+---------+---------+
| Column  | Type    |
+---------+---------+
| user_id | int     |
| name    | varchar |
| mail    | varchar |
+---------+---------+
```

- `user_id` is the primary key
- Each row contains user's ID, name, and email

**Email Validation Rules:**

A valid LeetCode email must satisfy **ALL** of the following:

1. Starts with a **letter** (uppercase or lowercase)
2. After the first letter, can contain: letters, digits, underscore (`_`), period (`.`), hyphen (`-`), slash (`/`)
3. Must end with `@leetcode.com`
4. Must have at least one character before `@`

Return all users with valid emails, ordered by `user_id`.

**Example:**

**Input:**

```
Users table:
+---------+-----------+-------------------------+
| user_id | name      | mail                    |
+---------+-----------+-------------------------+
| 1       | Winston   | winston@leetcode.com    |
| 2       | Jonathan  | jonathanisgreat         |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
| 5       | Marwan    | quarz#2020@leetcode.com |
| 6       | David     | david69@gmail.com       |
| 7       | Shapiro   | .shapo@leetcode.com     |
+---------+-----------+-------------------------+
```

**Output:**

```
+---------+-----------+-------------------------+
| user_id | name      | mail                    |
+---------+-----------+-------------------------+
| 1       | Winston   | winston@leetcode.com    |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
+---------+-----------+-------------------------+
```

**Explanation:**

- ✅ Winston: Valid (starts with letter, simple format)
- ❌ Jonathan: Invalid (no @leetcode.com)
- ✅ Annabelle: Valid (starts with letter, hyphen before @ is allowed)
- ✅ Sally: Valid (starts with letter, period allowed)
- ❌ Marwan: Invalid (# is not an allowed character)
- ❌ David: Invalid (wrong domain - gmail.com not leetcode.com)
- ❌ Shapiro: Invalid (starts with period, must start with letter)

---

## Approach

### The Challenge

This problem has **more complex username rules** than typical email validation:

- Must start with a letter (not just any alphanumeric)
- Allows special characters (`.`, `-`, `/`, `_`) in the username
- Domain is fixed (`@leetcode.com` only)

We need a regex pattern that:

1. Enforces "starts with letter" requirement
2. Allows specific special characters after the first letter
3. Matches exact domain

### The Solution: Two-Part Username Pattern

**The key insight:** Split username validation into two parts:

1. **First character(s):** Must be letter(s) only
2. **Remaining characters:** Can be letters, digits, or allowed special chars

**Pattern:**

```regex
^[A-Za-z]+[A-Za-z0-9_./-]*@leetcode\.com$
```

**Why two character classes:**

- `[A-Za-z]+` ensures at least one letter at the start
- `[A-Za-z0-9_./-]*` allows more flexible characters after
- This pattern **enforces order**: letters first, then anything allowed

If we used a single class like `[A-Za-z0-9_./-]+`, emails like `123abc@leetcode.com` would match incorrectly.

---

## Visual Flow

![Email Validation Flow](./diagrams/find_users_valid_emails_flow.jpg)

The diagram shows:

1. Input table with various email formats
2. Two-part regex pattern (starting letters + remaining chars)
3. Validation checking start condition and special chars
4. Domain verification (@leetcode.com)
5. Filtered results with valid emails only

---

## Solution

```sql
SELECT
    user_id,
    name,
    mail
FROM
    Users
WHERE
    mail ~ '^[A-Za-z]+[A-Za-z0-9_./-]*@leetcode\.com$';
```

**Simple and effective.** One pattern handles all validation rules.

### Pattern Breakdown

```regex
^                     Start of string (no leading chars)
[A-Za-z]+            One or more letters (MUST start with letter)
[A-Za-z0-9_./-]*     Zero or more: letters, digits, or ./_/-
@leetcode            Literal @leetcode
\.com                Literal .com (dot escaped)
$                    End of string (no trailing chars)
```

**Character class details:**

| Part               | Allowed Characters      | Reason                    |
| ------------------ | ----------------------- | ------------------------- |
| `[A-Za-z]+`        | Letters only            | First char must be letter |
| `[A-Za-z0-9_./-]*` | Letters, digits, `._/-` | Flexible middle part      |
| `@leetcode\.com`   | Exact string            | Fixed domain requirement  |

**Quantifiers:**

- `+` means "one or more" (requires at least one letter)
- `*` means "zero or more" (username can be just one letter)

---

## Complexity Analysis

**Time Complexity: O(n × m)**

- n = number of rows
- m = average email length
- Each email is scanned once by regex engine
- Pattern has no backtracking (efficient)

**Space Complexity: O(1)**

- No temporary storage
- Results streamed directly
- Sorting done by database engine

**Why 90.57% faster:**

- Efficient pattern with clear structure
- No expensive string functions
- Database-native regex compilation
- Single WHERE clause (no joins)

---

## Validation Examples

### Valid Emails ✅

```sql
'alice@leetcode.com'           Letters only
'a@leetcode.com'               Minimum valid (one letter)
'alice123@leetcode.com'        Letters then digits
'alice_bob@leetcode.com'       Underscore allowed
'alice.bob@leetcode.com'       Period allowed
'alice-bob@leetcode.com'       Hyphen allowed
'alice/bob@leetcode.com'       Slash allowed (unusual!)
'Alice@leetcode.com'           Uppercase start
'ALICE@leetcode.com'           All uppercase
'aBc123_./@leetcode.com'       Mixed everything
```

**Why valid:**

- All start with letter(s)
- Only use allowed characters
- End with @leetcode.com

### Invalid Emails ❌

```sql
'_alice@leetcode.com'          Starts with underscore
'1alice@leetcode.com'          Starts with digit
'.alice@leetcode.com'          Starts with period
'-alice@leetcode.com'          Starts with hyphen
'/alice@leetcode.com'          Starts with slash
'alice#bob@leetcode.com'       Hash not allowed
'alice+bob@leetcode.com'       Plus not allowed
'alice@gmail.com'              Wrong domain
'alice@leetcode.net'           Wrong TLD
'alice@sub.leetcode.com'       Subdomain not allowed
'@leetcode.com'                Empty username
'alice@LEETCODE.com'           Domain case-sensitive
```

**Common mistakes:**

- Not starting with letter
- Using disallowed special characters (#, +, \*, etc.)
- Wrong domain (must be exactly leetcode.com)
- Empty username

---

## Walk-Through

### Example 1: Main Test Case

```sql
Input:
+---------+-----------+-------------------------+
| user_id | name      | mail                    |
+---------+-----------+-------------------------+
| 1       | Winston   | winston@leetcode.com    |
| 2       | Jonathan  | jonathanisgreat         |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
| 5       | Marwan    | quarz#2020@leetcode.com |
| 6       | David     | david69@gmail.com       |
| 7       | Shapiro   | .shapo@leetcode.com     |
+---------+-----------+-------------------------+

Validation:

user_id=1: winston@leetcode.com
  Pattern: ^[A-Za-z]+[A-Za-z0-9_./-]*@leetcode\.com$
  Starts with 'winston' (letters) ✓
  No middle chars needed ✓
  Ends with @leetcode.com ✓
  VALID

user_id=2: jonathanisgreat
  Pattern: ^[A-Za-z]+[A-Za-z0-9_./-]*@leetcode\.com$
  Starts with 'jonathanisgreat' (letters) ✓
  Pattern requires @leetcode.com
  String has no @ at all
  INVALID

user_id=3: bella-@leetcode.com
  Pattern: ^[A-Za-z]+[A-Za-z0-9_./-]*@leetcode\.com$
  Starts with 'bella' (letters) ✓
  Middle: '-' is in [A-Za-z0-9_./-]* ✓
  Ends with @leetcode.com ✓
  VALID

user_id=4: sally.come@leetcode.com
  Pattern: ^[A-Za-z]+[A-Za-z0-9_./-]*@leetcode\.com$
  Starts with 'sally' (letters) ✓
  Middle: '.come' contains letters and period ✓
  Ends with @leetcode.com ✓
  VALID

user_id=5: quarz#2020@leetcode.com
  Pattern: ^[A-Za-z]+[A-Za-z0-9_./-]*@leetcode\.com$
  Starts with 'quarz' (letters) ✓
  Middle: '#2020' contains #
  # is NOT in [A-Za-z0-9_./-]*
  INVALID

user_id=6: david69@gmail.com
  Pattern: ^[A-Za-z]+[A-Za-z0-9_./-]*@leetcode\.com$
  Starts with 'david' (letters) ✓
  Middle: '69' (digits) ✓
  Ends with @gmail.com
  Pattern requires @leetcode.com (not gmail)
  INVALID

user_id=7: .shapo@leetcode.com
  Pattern: ^[A-Za-z]+[A-Za-z0-9_./-]*@leetcode\.com$
  String starts with '.'
  Pattern requires [A-Za-z]+ first
  . is NOT in [A-Za-z]
  INVALID

Output (sorted by user_id):
+---------+-----------+-------------------------+
| user_id | name      | mail                    |
+---------+-----------+-------------------------+
| 1       | Winston   | winston@leetcode.com    |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
+---------+-----------+-------------------------+
```

### Example 2: Edge Cases

```sql
Input:
+---------+------+-------------------+
| user_id | name | mail              |
+---------+------+-------------------+
| 1       | Min  | a@leetcode.com    |
| 2       | Edge | _@leetcode.com    |
| 3       | Test | 1@leetcode.com    |
| 4       | Max  | abc.def-ghi/jkl_mno123@leetcode.com |
+---------+------+-------------------+

Validation:

user_id=1: a@leetcode.com
  Starts with 'a' (one letter) ✓
  No middle chars (allowed by *) ✓
  VALID (minimum valid email)

user_id=2: _@leetcode.com
  Starts with '_'
  Pattern requires letter first
  INVALID

user_id=3: 1@leetcode.com
  Starts with '1' (digit)
  Pattern requires letter first
  INVALID

user_id=4: abc.def-ghi/jkl_mno123@leetcode.com
  Starts with 'abc' (letters) ✓
  Middle: '.def-ghi/jkl_mno123'
  All chars (., -, /, _, digits, letters) allowed ✓
  VALID (maximum complexity)

Output:
+---------+------+--------------------------------------+
| user_id | name | mail                                 |
+---------+------+--------------------------------------+
| 1       | Min  | a@leetcode.com                       |
| 4       | Max  | abc.def-ghi/jkl_mno123@leetcode.com  |
+---------+------+--------------------------------------+
```

---

## Key Insights

### Two-Part Username Pattern

**The genius of this pattern:**

```regex
[A-Za-z]+            Part 1: Must start with letter
[A-Za-z0-9_./-]*     Part 2: Then anything allowed
```

**Why not one class:**

```regex
[A-Za-z0-9_./-]+     This would allow '123abc@leetcode.com'
```

Single class can't enforce **order** (letter must be first). Two classes give us that control.

### The Asterisk (`*`) Choice

```regex
[A-Za-z0-9_./-]*     Zero or more allowed chars
```

**Why `*` not `+`:**

- Username can be just one letter: `a@leetcode.com`
- After the required letters, more chars are optional
- `*` means "0 or more" (letters alone are valid)
- `+` would require at least one char from this class

### Special Characters Allowed

The pattern allows: `._/-`

**Why these specific characters:**

- `.` - Common in emails (first.last@...)
- `_` - Alternative to space (first_last@...)
- `-` - Hyphen for compound names (mary-jane@...)
- `/` - Less common, but valid per problem

**Not allowed:**

- `#` - Hash
- `+` - Plus (common in Gmail aliases, not here)
- `*` - Asterisk
- `%` - Percent
- `!` - Exclamation

### Domain Specificity

```regex
@leetcode\.com       Exact domain required
```

**Different from generic email validation:**

- Generic: `@[a-z]+\.com` (any domain)
- This problem: `@leetcode\.com` (only LeetCode)

This makes validation **easier** - no need to validate domain structure.

---

## Alternative Approaches

### Using SIMILAR TO

```sql
WHERE mail SIMILAR TO '[A-Za-z]+[A-Za-z0-9_./-]*@leetcode.com'
```

**Problems:**

- SIMILAR TO uses SQL standard regex (less powerful)
- No anchors (^, $) by default
- Could match substrings
- **Your `~` operator is better**

### Using String Functions

```sql
WHERE LEFT(mail, 1) ~ '[A-Za-z]'
  AND mail LIKE '%@leetcode.com'
  AND mail NOT LIKE '%#%'
  AND mail NOT LIKE '%+%'
  -- ... more NOT LIKE for each disallowed char
```

**Problems:**

- Multiple conditions (slow)
- Hard to maintain
- Easy to miss a case

### Case Insensitive Operator

```sql
WHERE mail ~* '^[a-z]+[a-z0-9_./-]*@leetcode\.com$'
```

**Note:**

- `~*` is case-insensitive
- With `~*` you could use `[a-z]` instead of `[A-Za-z]`
- Both work

---

## What I Learned

**Two-part patterns enforce order.** When "first char must be X, rest can be Y", use two character classes.

**Asterisk vs plus matters.** `*` allows zero occurrences, `+` requires at least one.

**Fixed domains are easier.** When domain is constant, validation becomes simpler.

**Special characters need explicit listing.** Can't use shortcuts like `\w` when rules are specific.

**PostgreSQL regex is powerful.** The `~` operator handles complex patterns efficiently.

**Pattern design is about constraints.** Each part of the pattern encodes a rule from the problem.

---

## Fun Fact

**Solution beats 90.57%** with **352ms runtime**.

The two-part character class pattern is slightly more complex than a single class, but PostgreSQL's regex engine handles it efficiently. The performance proves that **clarity doesn't cost speed** when the pattern is well-designed.

---

_Solved December 6, 2025_  
_Runtime: 352ms (90.57%)_  
_Memory: 0.00 MB (100.00%)_  
_Problem #1,017_  
_Streak: 271 days_  
_PostgreSQL: 60 problems_

[← Back to Solutions](../../) | [LeetCode](https://leetcode.com/problems/find-users-with-valid-e-mails/)
