# 3759. Count Elements With at Least K Greater Values

**Difficulty:** Medium  
**Language:** Dart  
**Performance:** Runtime 847ms (Beats -%_), Memory 314.30 MB (Beats -%_)

_New problem - first submissions_

Solved December 4, 2025.

---

## Problem Statement

Given an integer array `nums` of length `n` and an integer `k`, count how many elements are **qualified**.

**Definition:** An element is **qualified** if there exist at least `k` elements in the array that are **strictly greater** than it.

Return the count of qualified elements.

**Example 1:**

```
Input: nums = [7, 7, 9, 9, 9, 3], k = 2
Output: 3

Explanation:
Element 3: Elements > 3 are [7,7,9,9,9] = 5 elements ≥ 2 ✓
Element 7: Elements > 7 are [9,9,9] = 3 elements ≥ 2 ✓
Element 7: Elements > 7 are [9,9,9] = 3 elements ≥ 2 ✓
Element 9: Elements > 9 are [] = 0 elements < 2 ✗

Qualified: 3 elements (the 3, and both 7s)
```

**Example 2:**

```
Input: nums = [1, 1, 1, 1], k = 1
Output: 0

Explanation:
All elements are 1
No element has any element > itself
No qualified elements
```

**Example 3:**

```
Input: nums = [5, 1, 3, 2, 4], k = 0
Output: 5

Explanation:
k = 0 means "at least 0 elements greater"
Every element satisfies this (even the max)
All 5 elements are qualified
```

**Constraints:**

- 1 ≤ n ≤ 10^5
- 1 ≤ nums[i] ≤ 10^9
- 0 ≤ k < n

---

## Approach

### The Challenge

For each element, we need to know: **How many elements in the array are strictly greater than this value?**

**Naive approach:** For each element, scan the entire array counting greater elements → O(n²)

With n up to 10^5, that's 10^10 operations—too slow.

### The Key Insight

Instead of counting for each element individually, **pre-compute counts for each unique value**.

**Observation:** All occurrences of the same value have the same count of greater elements.

**Strategy:**

1. Group elements by value (frequency map)
2. Sort values
3. For each value, compute how many elements are greater
4. Count qualified elements using these pre-computed values

### The Solution: Suffix Sum Technique

**Three-phase algorithm:**

**Phase 1: Build sorted frequency map**

- Use SplayTreeMap to get automatic sorting
- Maps value → count of occurrences

**Phase 2: Build suffix sums**

- For each value (right to left), compute how many elements are strictly greater
- This is a suffix sum: sum of counts of all larger values

**Phase 3: Count qualified elements**

- For each value with suffix sum ≥ k, add its frequency to result
- Early exit when suffix sum drops below k (smaller values won't qualify)

### Why This Works

The suffix sum `sumMap[v]` tells us: **"How many elements in the array are > v?"**

For a value to be qualified:

- Need: `sumMap[v] ≥ k`
- If qualified: all occurrences of this value are qualified
- Add `map[v]` to result

**Optimization:** Since values are sorted ascending and suffix sums are non-increasing, once we find a value that doesn't qualify, no smaller value will qualify either. **Break early.**

---

## Visual Flow

![Complete Algorithm Flow](./diagrams/count_k_greater_flow.jpg)

The diagram shows:

1. Input array with duplicate values
2. Building sorted frequency map with SplayTreeMap
3. Computing suffix sums (right to left scan)
4. Counting qualified elements (left to right with early exit)
5. Final result

---

## Solution

```dart
import 'dart:collection';

class Solution {
  int countElements(List<int> nums, int k) {
    // Edge case: k=0 means all elements qualify
    if (k == 0) return nums.length;

    int sum = 0;           // Running suffix sum
    int result = 0;        // Count of qualified elements
    Map<int, int> sumMap = {};  // value → count of elements > value

    // Phase 1: Build sorted frequency map
    SplayTreeMap<int, int> map = SplayTreeMap();
    for (var i = 0; i < nums.length; i++) {
      map[nums[i]] = (map[nums[i]] ?? 0) + 1;
    }

    List<int> keys = map.keys.toList();  // Already sorted ascending

    // Phase 2: Build suffix sums (right to left)
    // sumMap[v] = how many elements are > v
    for (var i = keys.length - 1; i >= 0; i--) {
      sumMap[keys[i]] = sum;        // Elements > this value
      sum += map[keys[i]]!;         // Add current value's count
    }

    // Phase 3: Count qualified elements (left to right)
    for (var i = 0; i < keys.length; i++) {
      if (sumMap[keys[i]]! >= k) {
        // All occurrences of this value are qualified
        result += map[keys[i]]!;
      } else {
        // Smaller values won't qualify either
        break;
      }
    }

    return result;
  }
}
```

---

## Complexity Analysis

**Time Complexity: O(n log n)**

- Build frequency map: O(n log n) - SplayTreeMap insert costs O(log n) each
- Build suffix sums: O(u) where u = unique values
- Count qualified: O(u) with early break optimization
- **Total: O(n log n)** dominated by map construction

**Space Complexity: O(u)**

- Where u = number of unique values
- SplayTreeMap: O(u) entries
- sumMap: O(u) entries
- keys list: O(u) elements
- Best case (all same): O(1)
- Worst case (all unique): O(n)

---

## Walk-Through

### Example 1: Multiple Values with Duplicates

```dart
nums = [7, 7, 9, 9, 9, 3], k = 2

Phase 1: Build frequency map
Sorted map = {3:1, 7:2, 9:3}
keys = [3, 7, 9]

Phase 2: Build suffix sums (right to left)
sum = 0

i=2 (key=9):
  sumMap[9] = 0     // No elements > 9
  sum = 0 + 3 = 3   // Three 9s counted

i=1 (key=7):
  sumMap[7] = 3     // Three elements (the 9s) > 7
  sum = 3 + 2 = 5   // Add two 7s

i=0 (key=3):
  sumMap[3] = 5     // Five elements [7,7,9,9,9] > 3
  sum = 5 + 1 = 6   // Add one 3

Result: sumMap = {3:5, 7:3, 9:0}

Phase 3: Count qualified (left to right)
i=0 (key=3):
  sumMap[3] = 5 ≥ 2? YES ✓
  result += map[3] = 1
  result = 1

i=1 (key=7):
  sumMap[7] = 3 ≥ 2? YES ✓
  result += map[7] = 2
  result = 3

i=2 (key=9):
  sumMap[9] = 0 ≥ 2? NO ✗
  break (smaller values won't qualify)

Final result: 3
```

### Example 2: All Same Value

```dart
nums = [1, 1, 1, 1], k = 1

Phase 1: Build frequency map
map = {1:4}
keys = [1]

Phase 2: Build suffix sums
i=0 (key=1):
  sumMap[1] = 0   // No elements > 1
  sum = 0 + 4 = 4

Phase 3: Count qualified
i=0 (key=1):
  sumMap[1] = 0 ≥ 1? NO ✗
  break

Result: 0 (no qualified elements)
```

### Example 3: k = 0 Edge Case

```dart
nums = [5, 1, 3], k = 0

Early return: if (k == 0) return nums.length;

Result: 3 (all elements qualified)

Why? Every element has ≥ 0 elements greater than it.
```

### Example 4: Strictly Increasing Array

```dart
nums = [1, 2, 3, 4, 5], k = 2

Phase 1: Build frequency map
map = {1:1, 2:1, 3:1, 4:1, 5:1}
keys = [1, 2, 3, 4, 5]

Phase 2: Build suffix sums
sumMap = {1:4, 2:3, 3:2, 4:1, 5:0}

Phase 3: Count qualified
i=0: sumMap[1]=4 ≥ 2 ✓ → result = 1
i=1: sumMap[2]=3 ≥ 2 ✓ → result = 2
i=2: sumMap[3]=2 ≥ 2 ✓ → result = 3
i=3: sumMap[4]=1 ≥ 2 ✗ → break

Result: 3 elements (1, 2, 3 are qualified)
```

---

## Key Insights

### Suffix Sum Pattern

The suffix sum technique efficiently answers "how many elements are greater than X?"

```dart
// Building suffix sum right to left
for (i from end to start) {
    sumMap[keys[i]] = sum;  // Elements greater so far
    sum += map[keys[i]]!;   // Add current count
}
```

This gives us O(1) lookup for "count of greater elements" during the counting phase.

### Early Exit Optimization

```dart
if (sumMap[keys[i]]! >= k) {
    result += map[keys[i]]!;
} else {
    break;  // Critical optimization
}
```

**Why this works:**

- Keys are sorted ascending: [small → large]
- Suffix sums are non-increasing: [large → small]
- Once suffix sum < k, all remaining (smaller) values also have suffix sum < k
- **No need to check further**

This turns worst-case O(u) into average-case much faster when k is large.

### The k=0 Edge Case

```dart
if (k == 0) return nums.length;
```

When k=0, **every element qualifies** because every element has at least 0 elements greater than it (including the maximum).

This edge case saves unnecessary computation.

### SplayTreeMap Choice

Using `SplayTreeMap` instead of manually sorting:

- Automatic sorting during insertion
- O(log n) insert/lookup
- Clean API with `.keys.toList()`

**Alternative:** Sort array first, then count frequencies → same time complexity, but less clean code.

---

## Alternative Approaches

### Sort and Count Directly

```dart
int countElements(List<int> nums, int k) {
    if (k == 0) return nums.length;

    nums.sort();
    int result = 0;

    for (int i = 0; i < nums.length; i++) {
        int greaterCount = nums.length - i - 1;
        if (greaterCount >= k) {
            result++;
        } else {
            break;
        }
    }

    return result;
}
```

**Comparison:**

- Simpler code
- Same O(n log n) time
- **But modifies input array** (side effect)
- Doesn't handle duplicates elegantly

**Your approach is better** because:

- ✅ Doesn't modify input
- ✅ Handles duplicates naturally via frequency map
- ✅ More maintainable (clear phases)

### Hash Map + Manual Sort

```dart
int countElements(List<int> nums, int k) {
    if (k == 0) return nums.length;

    Map<int, int> freq = {};
    for (var num in nums) {
        freq[num] = (freq[num] ?? 0) + 1;
    }

    List<int> sorted = freq.keys.toList()..sort();

    // ... rest same as your solution
}
```

**Comparison:**

- Uses HashMap (unordered) then sorts
- O(n) for building map + O(u log u) for sorting
- Same total complexity
- **Your SplayTreeMap approach is cleaner** (no separate sort step)

---

## What I Learned

**Suffix sums solve "count greater" efficiently.** Build once, query many times in O(1).

**SplayTreeMap is perfect for frequency + sorting.** Combines two operations elegantly.

**Early exit in sorted data.** When conditions are monotonic, break early to save work.

**Edge cases matter.** The k=0 check saves computation and handles the degenerate case cleanly.

**Grouping by value.** When duplicates exist, process unique values rather than individual elements.

**Three-phase algorithms can be clean.** Build data → Pre-compute info → Use info. Each phase has one job.

---

_Solved December 4, 2025_  
_Runtime: 847ms_  
_Memory: 314.30 MB_  
_Problem #1,015_  
_Streak: 269 days_

[← Back to Solutions](../../) | [LeetCode](https://leetcode.com/problems/count-elements-with-at-least-k-greater-values/)
