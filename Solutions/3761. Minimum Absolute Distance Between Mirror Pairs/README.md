# 3761. Minimum Absolute Distance Between Mirror Pairs

**Difficulty:** Medium  
**Language:** Dart  
**Performance:** Runtime 329ms (Beats 100%), Memory 247.82 MB (Beats 100%)

Solved December 1, 2025.

---

## Problem Statement

Given an array of integers, find the minimum absolute distance between any two indices where one number is the mirror (reverse) of the other.

A mirror of a number is its digits reversed. For example:

- Mirror of 123 is 321
- Mirror of 100 is 001 (which equals 1)
- Mirror of 5 is 5 (palindrome)

Return the minimum distance between any pair of mirror numbers, or -1 if no such pair exists.

**Example:**

```
Input: nums = [11, 69, 23, 96, 32]
Output: 2

Explanation:
- nums[1] = 69, nums[3] = 96 (mirror pair at distance 2)
- nums[2] = 23, nums[4] = 32 (mirror pair at distance 2)
Minimum distance is 2
```

**Constraints:**

- 1 ≤ nums.length ≤ 10^5
- 1 ≤ nums[i] ≤ 10^9

---

## Approach

The naive solution—checking every pair—would be O(n²). With up to 100,000 elements, that's too slow.

### The Key Insight

Instead of comparing every element to every other element, **group elements by value first**. Then for each value, check only its mirror.

**Data structure:** Hash map storing value → list of indices

### Algorithm

1. **Build index map** - One pass through the array, store all positions for each value
2. **Check mirror pairs** - For each value, find its mirror and check all position combinations
3. **Early exit** - If we find distance 1, stop immediately (can't get better)

### Why This Works

If a value appears multiple times and its mirror also appears multiple times, we only need to check:

- Positions of value A vs positions of mirror(A)
- Not all n² combinations of indices

This reduces comparisons significantly when values repeat.

---

## Solution

```dart
class Solution {
  int minMirrorPairDistance(List<int> nums) {
    int result = -1;
    Map<int, List<int>> mapIndex = {};

    // Build index map: value → [positions where it appears]
    for (var i = 0; i < nums.length; i++) {
      if (mapIndex.containsKey(nums[i]))
        mapIndex[nums[i]]!.add(i);
      else
        mapIndex[nums[i]] = [i];
    }

    // Check each value and its mirror
    for (var i = 0; i < nums.length; i++) {
      // Calculate mirror by reversing digits
      int temp = int.parse(nums[i].toString().split('').reversed.join());

      // Check all positions where the mirror appears
      for (int j in mapIndex[temp] ?? []) {
        if (i < j) {  // Only count each pair once
          int tempResult = (i - j).abs();
          if (tempResult < result || result == -1)
            result = tempResult;
          if (result == 1) return 1;  // Can't get better than 1
        }
      }
    }

    return result;
  }
}
```

---

## Complexity Analysis

**Time Complexity:** O(n × m × d)

- n = array length
- m = average number of positions for each mirror value
- d = digits in number (max 10 for 10^9)

In practice, closer to **O(n)** because:

- Most values don't have mirrors in the array (m = 0)
- Early exit when distance = 1
- String operations on ≤10 digits are negligible

**Space Complexity:** O(n)

- Hash map stores all n indices
- Temporary string operations use O(d) = O(10) = O(1)

**Why the early exit matters:**

Without `if (result == 1) return 1;` → **TLE (Time Limit Exceeded)**  
With the early exit → **329ms, beats 100%**

When you find distance 1 (adjacent mirror pairs), you're done. Can't get closer than that.

---

## Key Insights

### Mirror Calculation

```dart
int temp = int.parse(nums[i].toString().split('').reversed.join());
```

This works efficiently because:

- Max value is 10^9 = 10 digits
- String operations on 10 characters are fast
- No need to optimize further

### The `i < j` Check

```dart
if (i < j) {
    // Process pair
}
```

This prevents counting the same pair twice:

- When i=0 finds mirror at j=5, we process it
- When i=5 finds mirror at j=0, we skip it (already counted)

### The Magic Line

```dart
if (result == 1) return 1;  // all magic does that row XD
```

This single line saves the solution from TLE. Once you find distance 1, searching further is pointless. You've found the minimum possible distance.

**This is pragmatic optimization**—discovered through experience, not theory.

---

## Walk-Through

### Example: Finding Mirror Pairs

```dart
nums = [11, 69, 23, 96, 32]

Step 1: Build index map
mapIndex = {
    11: [0],
    69: [1],
    23: [2],
    96: [3],
    32: [4]
}

Step 2: Check each element
i=0: nums[0]=11, mirror=11
     Check mapIndex[11] = [0]
     j=0: skip (i < j fails)

i=1: nums[1]=69, mirror=96
     Check mapIndex[96] = [3]
     j=3: distance = |1-3| = 2
     result = 2

i=2: nums[2]=23, mirror=32
     Check mapIndex[32] = [4]
     j=4: distance = |2-4| = 2
     result = 2 (unchanged)

i=3: nums[3]=96, mirror=69
     Check mapIndex[69] = [1]
     j=1: skip (i < j fails, already counted)

i=4: nums[4]=32, mirror=23
     Check mapIndex[23] = [2]
     j=2: skip (i < j fails, already counted)

Final result: 2
```

### Example: Early Exit

```dart
nums = [12, 21, 5, 99]

i=0: nums[0]=12, mirror=21
     Check mapIndex[21] = [1]
     j=1: distance = 1
     result = 1
     RETURN 1 immediately (early exit)

Never checks i=2 or i=3.
```

---

## What I Learned

**Hash maps turn O(n²) into O(n).** Instead of comparing everything to everything, group by value first.

**Early exits matter.** That one `if (result == 1)` line is the difference between TLE and AC.

**String operations are fine for small inputs.** Max 10 digits means the toString/reverse/parse chain is negligible.

**The `i < j` pattern prevents double-counting.** Clean way to handle symmetric pairs.

**Pragmatic beats perfect.** The solution isn't theoretically optimal, but it runs in 329ms and beats 100%. That's what matters.

---

_Solved December 1, 2025_  
_Runtime: 329ms (100%)_  
_Memory: 247.82 MB (100%)_

[← Back to Solutions](../../) | [LeetCode](https://leetcode.com/problems/minimum-absolute-distance-between-mirror-pairs/)
