# 3769. Sort Integers by Binary Reflection

**Difficulty:** Easy  
**Language:** Dart  
**Performance:** Runtime 103ms (Beats 100.00%), Memory 156.59 MB (Beats 100.00%)

Solved December 8, 2025.

---

## Problem Statement

Given an array of integers, sort them based on the **binary reflection** (reversed binary representation) of each number.

**Binary reflection:** Reverse the binary representation of a number and convert back to decimal.

**Sorting rules:**

1. Sort primarily by binary reflection (ascending)
2. If two numbers have the same binary reflection, sort them by their original value (ascending)

**Example:**

```
Input: nums = [5, 3, 2, 8]
Output: [2, 8, 5, 3]

Explanation:
5 → binary: 101 → reversed: 101 → decimal: 5
3 → binary: 11 → reversed: 11 → decimal: 3
2 → binary: 10 → reversed: 01 → decimal: 1
8 → binary: 1000 → reversed: 0001 → decimal: 1

Grouped by reflection:
  reflection=1: [2, 8]
  reflection=3: [3]
  reflection=5: [5]

Result: [2, 8] + [3] + [5] = [2, 8, 3, 5]

Wait, that's wrong. Let me recalculate:
2 → 10 → 01 → 1
8 → 1000 → 0001 → 1

Both have reflection=1, so sort by original: [2, 8]
```

---

## Approach

### The Challenge

We need to:

1. Calculate binary reflection for each number
2. Group numbers by their reflection
3. Sort groups by reflection value
4. Within each group, sort by original value

### The Solution: Group + Sort Pattern

**Strategy:**

1. Use a sorted map (SplayTreeMap) with reflection as key
2. Store original numbers in lists as values
3. Sort each list before flattening
4. Use memoization to avoid recalculating reflections

---

## Visual Flow

![Sort by Binary Reflection Flow](./diagrams/sort_binary_reflection_flow.jpg)

The diagram shows:

1. Input array with various integers
2. Binary reflection calculation for each
3. Grouping by reflection value (auto-sorted by SplayTreeMap)
4. Secondary sort within groups
5. Flattened result array

---

## Solution

```dart
import 'dart:collection';

extension IntExtensions on int {
  int reversedByBinary() {
    return int.parse(
      this.toRadixString(2).split('').reversed.join(),
      radix: 2
    );
  }
}

class Solution {
  List<int> sortByReflection(List<int> nums) {
    SplayTreeMap<int, List<int>> storage = SplayTreeMap();
    Map<int, int> map = {};

    for (var i = 0; i < nums.length; i++) {
      // Memoize binary reflection calculation
      if (!map.containsKey(nums[i])) {
        map[nums[i]] = nums[i].reversedByBinary();
      }

      int reversed = map[nums[i]]!;

      // Group by reflection value
      if (storage.containsKey(reversed)) {
        storage[reversed]!.add(nums[i]);
      } else {
        storage[reversed] = [nums[i]];
      }
    }

    List<int> result = [];
    for (var key in storage.keys) {
      // Sort each group and add to result
      result.addAll(storage[key]!..sort());
    }

    return result;
  }
}
```

---

## Complexity Analysis

**Time Complexity: O(n log n + n × b)**

- Binary reflection calculation: O(n × b) where b = bits per number
- SplayTreeMap operations: O(n log n) for insertions
- Sorting within groups: O(n log n) worst case
- Total: O(n log n)

**Space Complexity: O(n)**

- SplayTreeMap storage: O(n)
- Memoization map: O(u) where u = unique numbers
- Result array: O(n)

---

## Key Techniques

### Extension Method

```dart
extension IntExtensions on int {
  int reversedByBinary() {
    return int.parse(
      this.toRadixString(2).split('').reversed.join(),
      radix: 2
    );
  }
}
```

**Benefits:**

- Clean syntax: `num.reversedByBinary()`
- Encapsulation: logic lives with the type
- Reusability: can be used anywhere

**How it works:**

```dart
5.toRadixString(2)           // "101"
   .split('')                // ['1', '0', '1']
   .reversed                 // ['1', '0', '1']
   .join()                   // "101"
int.parse(..., radix: 2)     // 5
```

### Memoization Map

```dart
Map<int, int> map = {};
if (!map.containsKey(nums[i])) {
    map[nums[i]] = nums[i].reversedByBinary();
}
int reversed = map[nums[i]]!;
```

**Why memoize:**

- Binary conversion is expensive
- Same number might appear multiple times
- Cache result for O(1) lookup

**Example:**

```
nums = [5, 3, 5, 3, 5]
Without memoization: 5 calculations
With memoization: 2 calculations (5 and 3)
```

### SplayTreeMap Auto-Sorting

```dart
SplayTreeMap<int, List<int>> storage = SplayTreeMap();
```

**Key feature:** Maintains keys in sorted order automatically.

**Why this matters:**

```dart
storage[5] = [...]
storage[1] = [...]
storage[3] = [...]

for (var key in storage.keys) {
    // Iterates in order: 1, 3, 5
}
```

No manual sorting of reflection values needed!

### Cascade Operator

```dart
result.addAll(storage[key]!..sort());
```

**Dart's cascade operator (`..`):**

- Performs operation on object
- Returns the object itself
- Allows chaining

**Equivalent to:**

```dart
var list = storage[key]!;
list.sort();
result.addAll(list);
```

---

## Walk-Through

### Example: Complete Process

```dart
Input: nums = [5, 3, 2]

Step 1: Calculate binary reflections
5 → binary: 101 → reversed: 101 → decimal: 5
3 → binary: 11 → reversed: 11 → decimal: 3
2 → binary: 10 → reversed: 01 → decimal: 1

Memoization map: {5: 5, 3: 3, 2: 1}

Step 2: Group by reflection
SplayTreeMap (auto-sorted by keys):
  1: [2]
  3: [3]
  5: [5]

Step 3: Flatten (sort within groups)
Group 1: [2] (already sorted)
Group 3: [3] (already sorted)
Group 5: [5] (already sorted)

Result: [2, 3, 5]
```

### Example: Duplicate Reflections

```dart
Input: nums = [8, 2, 4, 1]

Step 1: Calculate reflections
8 → 1000 → 0001 → 1
2 → 10 → 01 → 1
4 → 100 → 001 → 1
1 → 1 → 1 → 1

All have reflection = 1!

Step 2: Group by reflection
SplayTreeMap:
  1: [8, 2, 4, 1]

Step 3: Sort within group
Group 1: [8, 2, 4, 1] → sorted → [1, 2, 4, 8]

Result: [1, 2, 4, 8]
```

### Example: Mixed Reflections

```dart
Input: nums = [7, 9, 5]

Step 1: Calculate reflections
7 → 111 → 111 → 7
9 → 1001 → 1001 → 9
5 → 101 → 101 → 5

Step 2: Group by reflection
SplayTreeMap:
  5: [5]
  7: [7]
  9: [9]

Step 3: Flatten
Result: [5, 7, 9]
```

---

## What I Learned

**Extension methods make code readable.** `num.reversedByBinary()` is clearer than `reverseBinary(num)`.

**Memoization prevents redundant work.** Cache expensive calculations.

**SplayTreeMap combines grouping and sorting.** One structure, two purposes.

**Cascade operators enable fluent code.** `..sort()` is more elegant than multi-line alternatives.

**Binary string manipulation is simple in Dart.** `toRadixString(2)` and `int.parse(..., radix: 2)` handle conversions cleanly.

---

_Solved December 8, 2025_  
_Runtime: 103ms (100.00%)_  
_Memory: 156.59 MB (100.00%)_  
_Problem #1,020_  
_Streak: 273 days_  
_Dart: 907 problems_

[← Back to Solutions](../../) | [LeetCode](https://leetcode.com/problems/sort-integers-by-binary-reflection/)
