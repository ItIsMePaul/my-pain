# 3760. Maximum Substrings With Distinct Start

**Difficulty:** Medium  
**Language:** Dart  
**Performance:** Runtime 100ms (Beats -%_), Memory 171.42 MB (Beats -%_)

_First submission for this new problem_

Solved December 3, 2025.

---

## Problem Statement

Given a string `s`, find the maximum number of substrings with distinct starting characters.

A substring is **valid** if it starts with a character that hasn't been used as a starting character in any other selected substring.

Return the maximum number of such substrings you can select.

**Example 1:**

```
Input: s = "abcab"
Output: 3

Explanation:
We can select substrings starting with:
- 'a': "a" or "ab" or "abcab"
- 'b': "b" or "bc" or "bcab"
- 'c': "c" or "cab"

Maximum distinct starts = 3 (a, b, c)
```

**Example 2:**

```
Input: s = "aaaa"
Output: 1

Explanation:
All characters are 'a'
Only one distinct starting character
Maximum = 1
```

**Example 3:**

```
Input: s = "abba"
Output: 2

Explanation:
Distinct starting characters: a, b
Maximum = 2
```

**Constraints:**

- 1 ≤ s.length ≤ 10^5
- `s` consists of lowercase English letters

---

## Approach

### The Key Insight

The problem asks for the **maximum number of substrings with distinct starting characters**.

**Critical observation:** The maximum is simply the number of **unique characters** in the string.

**Why?** Because:

- Each unique character can start at least one substring
- We want substrings with **distinct** starts
- The limit is the number of different characters available

**Example:**

```
s = "abcabc"
Unique chars: {a, b, c}
We can pick:
- "a" (starts with a)
- "b" (starts with b)
- "c" (starts with c)
Maximum = 3
```

It doesn't matter how many times each character appears—what matters is **how many different characters exist**.

### The Solution: Count Unique Characters

The solution is elegant:

1. Split string into characters
2. Convert to Set (removes duplicates)
3. Return the size

**In Dart:** `s.split('').toSet().length`

That's it. One line.

---

## Visual Flow

![Complete Algorithm Flow](./diagrams/max_distinct_flow.jpg)

The diagram shows:

1. Input string with repeated characters
2. Split operation converting to character list
3. Set conversion removing duplicates
4. Length extraction giving the answer

---

## Solution

```dart
class Solution {
  int maxDistinct(String s) {
    // Split string into chars, convert to Set (removes duplicates), get size
    return s.split('').toSet().length;
  }
}
```

**That's the entire solution.** Three operations chained together.

### Breaking It Down

```dart
s.split('')        // "abcab" → ['a', 'b', 'c', 'a', 'b']
  .toSet()         // ['a', 'b', 'c', 'a', 'b'] → {'a', 'b', 'c'}
  .length          // {'a', 'b', 'c'} → 3
```

**Each step:**

1. **`split('')`** - Converts string to list of individual characters

   - "hello" → ['h', 'e', 'l', 'l', 'o']

2. **`.toSet()`** - Converts list to Set, automatically removing duplicates

   - ['h', 'e', 'l', 'l', 'o'] → {'h', 'e', 'l', 'o'}
   - Sets only keep unique elements

3. **`.length`** - Returns the size of the Set
   - {'h', 'e', 'l', 'o'} → 4

---

## Complexity Analysis

**Time Complexity: O(n)**

- `split('')`: O(n) to iterate through string
- `toSet()`: O(n) to build Set (with O(1) hash insertions)
- `.length`: O(1) to read Set size
- **Total: O(n)**

**Space Complexity: O(k)**

- Where k = number of unique characters
- Character list: O(n) temporary space
- Set: O(k) space where k ≤ 26 for lowercase English
- **Effectively O(min(n, 26)) = O(1)** for English alphabet

**Why O(1) space?**  
For lowercase English letters, k ≤ 26 (constant). Even if string has millions of characters, the Set never exceeds 26 elements.

---

## Walk-Through

### Example 1: Mixed Characters

```dart
s = "abcab"

Step 1: split('')
['a', 'b', 'c', 'a', 'b']

Step 2: toSet()
Start with empty Set: {}
Add 'a': {'a'}
Add 'b': {'a', 'b'}
Add 'c': {'a', 'b', 'c'}
Add 'a': {'a', 'b', 'c'} (already exists, ignored)
Add 'b': {'a', 'b', 'c'} (already exists, ignored)

Final Set: {'a', 'b', 'c'}

Step 3: .length
3

Answer: 3
```

### Example 2: All Same Character

```dart
s = "aaaa"

Step 1: split('')
['a', 'a', 'a', 'a']

Step 2: toSet()
Start with empty Set: {}
Add 'a': {'a'}
Add 'a': {'a'} (duplicate, ignored)
Add 'a': {'a'} (duplicate, ignored)
Add 'a': {'a'} (duplicate, ignored)

Final Set: {'a'}

Step 3: .length
1

Answer: 1
```

### Example 3: Full Alphabet

```dart
s = "abcdefghijklmnopqrstuvwxyz"

Step 1: split('')
['a', 'b', 'c', ..., 'z'] (26 characters)

Step 2: toSet()
{'a', 'b', 'c', ..., 'z'} (26 unique)

Step 3: .length
26

Answer: 26 (maximum possible for lowercase English)
```

---

## Why This Works

### The Problem's Hidden Simplicity

At first glance, "maximum substrings with distinct starts" sounds complex. You might think about:

- Generating all possible substrings
- Checking which ones have distinct starts
- Finding the maximum combination

But the key insight simplifies everything:

**You're not choosing specific substrings—you're counting possible starting characters.**

### Proof of Correctness

**Claim:** Maximum distinct-start substrings = unique characters

**Proof:**

1. Each distinct character can start at least one substring (itself)
2. Two substrings with the same starting character violate "distinct starts"
3. Therefore, we can select at most one substring per unique character
4. We can always achieve this maximum by selecting single-character substrings
5. Thus, the answer is exactly the count of unique characters ∎

**Example validation:**

```
s = "aabbc"
Unique chars: {a, b, c} = 3

Can we get 4? No—only 3 distinct starting chars exist.
Can we get 3? Yes—select "a", "b", "c" (all distinct starts).

Answer: 3 ✓
```

### Why One-Liners Are Beautiful

This problem demonstrates that **understanding the problem deeply** often reveals surprisingly simple solutions.

The solution isn't clever—it's **correct because it matches the problem's true nature**.

---

## Edge Cases

All handled naturally by the solution:

✅ **Single character:** `"a"` → `{'a'}` → 1  
✅ **All same:** `"aaaa"` → `{'a'}` → 1  
✅ **All unique:** `"abc"` → `{'a','b','c'}` → 3  
✅ **Empty string:** Not in constraints (1 ≤ length)  
✅ **Maximum length (10^5):** O(n) handles it efficiently

---

## Alternative Approaches

### Using a Set with Iteration

```dart
int maxDistinct(String s) {
    Set<String> seen = {};
    for (int i = 0; i < s.length; i++) {
        seen.add(s[i]);
    }
    return seen.length;
}
```

**Comparison:**

- Your approach: `O(n)` time, clean one-liner
- This approach: `O(n)` time, more verbose
- **Both correct, yours is cleaner**

### Using a Frequency Map

```dart
int maxDistinct(String s) {
    Map<String, int> freq = {};
    for (var char in s.split('')) {
        freq[char] = (freq[char] ?? 0) + 1;
    }
    return freq.length;
}
```

**Comparison:**

- This counts frequencies (unnecessary for this problem)
- More space used (stores counts)
- **Overkill for just counting unique chars**

### Your Solution Wins

```dart
return s.split('').toSet().length;
```

**Why it's best:**

- ✅ Shortest (one line)
- ✅ Clearest (intent is obvious)
- ✅ Efficient (O(n) time, O(1) space)
- ✅ Idiomatic Dart

**This is the "Dart way" to solve it.**

---

## What I Learned

**Simple problems deserve simple solutions.** Sometimes the answer is just counting unique elements.

**One-liners aren't always code golf.** When the solution is genuinely simple, a one-liner is the right choice.

**Dart's method chaining is elegant.** `split('').toSet().length` reads like English: "split, make unique, count."

**Understanding > Implementation.** The hard part was recognizing that "maximum distinct-start substrings" = "unique characters." The code is trivial once you see it.

**Sets are powerful.** Need unique elements? Use a Set. It's built for this.

---

## Fun Fact

This solution is **100ms** on first submission for a new problem. No optimization needed. Sometimes the first solution is already optimal.

The beauty is in the insight, not the code complexity.

---

_Solved December 3, 2025_  
_Runtime: 100ms_  
_Memory: 171.42 MB_  
_Problem #1,014_  
_Streak: 268 days_

[← Back to Solutions](../../) | [LeetCode](https://leetcode.com/problems/maximum-substrings-with-distinct-start/)
