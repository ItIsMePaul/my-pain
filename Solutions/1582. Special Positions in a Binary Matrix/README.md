# 1582. Special Positions in a Binary Matrix

**Difficulty:** Easy  
**Language:** Dart  
**Performance:** Runtime 5ms (Beats 100%), Memory 151.85 MB (Beats 100%)

Solved December 2, 2025.

---

## Problem Statement

Given a binary matrix, find positions where the value is 1 and all other elements in that row and column are 0.

**Definition:** A position `(i, j)` is **special** if:

- `mat[i][j] == 1`
- All other elements in row `i` are `0`
- All other elements in column `j` are `0`

Return the count of special positions.

**Example 1:**

```
Input: mat = [[1,0,0],
              [0,0,1],
              [1,0,0]]
Output: 1

Explanation:
Position (1,2) is special:
- mat[1][2] = 1
- Row 1: [0,0,1] has only one 1 ✓
- Col 2: [0,1,0] has only one 1 ✓
```

**Example 2:**

```
Input: mat = [[1,0,0],
              [0,1,0],
              [0,0,1]]
Output: 3

Explanation:
(0,0), (1,1), (2,2) are all special (diagonal 1s)
```

**Example 3:**

```
Input: mat = [[0,0,0,1],
              [1,0,0,0],
              [0,1,1,0],
              [0,0,0,0]]
Output: 2

Explanation:
- (0,3): row 0 has one 1, col 3 has one 1 ✓
- (1,0): row 1 has one 1, col 0 has one 1 ✓
- (2,1): row 2 has TWO 1s ✗ (not special)
```

**Constraints:**

- `m == mat.length`
- `n == mat[i].length`
- `1 ≤ m, n ≤ 100`
- `mat[i][j] is either 0 or 1`

---

## Approach

### The Challenge

We need to find positions where:

1. The position itself is 1
2. It's the **only** 1 in its row
3. It's the **only** 1 in its column

Naive approach: For each 1, check entire row and column → O(m × n × (m + n))

Better approach: **Pre-compute row and column information**, then validate.

### The Solution: Position Mapping

Instead of checking each cell individually, build maps of where 1s appear:

**Two passes through the matrix:**

1. **Horizontal pass** - For each row, record which columns have 1s
2. **Vertical pass** - For each column, record which rows have 1s

**Then check:** If a row has exactly one 1 (at column j), and column j also has exactly one 1, that position is special.

### Why This Works

A position is special ⟺ (its row has one 1) AND (its column has one 1)

By pre-computing these counts, we avoid re-scanning the matrix for each candidate position.

---

## Visual Flow

![Complete Algorithm Flow](./diagrams/special_positions_flow.jpg)

The diagram shows the complete algorithm flow:

1. Initial binary matrix
2. Horizontal scan building mapHorizontally
3. Vertical scan building mapVertically
4. Validation checking row.length == 1 and column.length == 1
5. Final result with special positions identified

---

## Solution

```dart
class Solution {
  int numSpecial(List<List<int>> mat) {
    // Map: row index → list of column indices where 1s appear
    List<List<int>> mapHorizontally = [];
    // Map: column index → list of row indices where 1s appear
    List<List<int>> mapVertically = [];

    // Horizontal pass: record 1s position in each row
    for (var i = 0; i < mat.length; i++) {
      mapHorizontally.add([]);
      for (var j = 0; j < mat[i].length; j++) {
        if (mat[i][j] == 1) {
          mapHorizontally[i].add(j);
        }
      }
    }

    // Vertical pass: record 1s position in each column
    for (var i = 0; i < mat[0].length; i++) {
      mapVertically.add([]);
      for (var j = 0; j < mat.length; j++) {
        if (mat[j][i] == 1) {
          mapVertically[i].add(j);
        }
      }
    }

    // Count special positions
    int result = 0;
    for (var row in mapHorizontally) {
      // If row has exactly one 1 (at column row.first)
      if (row.length == 1) {
        // Check if that column also has exactly one 1
        if (mapVertically[row.first].length == 1) {
          result++;
        }
      }
    }

    return result;
  }
}
```

---

## Complexity Analysis

**Time Complexity: O(m × n)**

- First loop: O(m × n) to scan all rows
- Second loop: O(n × m) to scan all columns
- Third loop: O(m) to check special positions
- Total: O(m × n)

**Space Complexity: O(k)**

- Where k = number of 1s in the matrix
- mapHorizontally stores k positions total
- mapVertically stores k positions total
- Best case (sparse matrix): O(1)
- Worst case (all 1s): O(m × n)

---

## Walk-Through

### Example 1: Finding Special Positions

```dart
mat = [[1, 0, 0],
       [0, 0, 1],
       [1, 0, 0]]

Step 1: Horizontal scan
Row 0: [1,0,0] → 1 at column 0
       mapHorizontally[0] = [0]

Row 1: [0,0,1] → 1 at column 2
       mapHorizontally[1] = [2]

Row 2: [1,0,0] → 1 at column 0
       mapHorizontally[2] = [0]

Result: mapHorizontally = [[0], [2], [0]]

Step 2: Vertical scan
Col 0: [1,0,1] → 1s at rows 0,2
       mapVertically[0] = [0, 2]

Col 1: [0,0,0] → no 1s
       mapVertically[1] = []

Col 2: [0,1,0] → 1 at row 1
       mapVertically[2] = [1]

Result: mapVertically = [[0,2], [], [1]]

Step 3: Check special positions
Row 0: has 1 one at col 0
       But col 0 has 2 ones [0,2] ✗

Row 1: has 1 one at col 2
       And col 2 has 1 one [1] ✓
       result++

Row 2: has 1 one at col 0
       But col 0 has 2 ones [0,2] ✗

Final result: 1
Position (1,2) is the only special position
```

### Example 2: Multiple Special Positions

```dart
mat = [[1, 0, 0],
       [0, 1, 0],
       [0, 0, 1]]

Step 1: Horizontal scan
mapHorizontally = [[0], [1], [2]]
Each row has exactly one 1

Step 2: Vertical scan
mapVertically = [[0], [1], [2]]
Each column has exactly one 1

Step 3: Check special positions
Row 0: one 1 at col 0, col 0 has one 1 ✓
Row 1: one 1 at col 1, col 1 has one 1 ✓
Row 2: one 1 at col 2, col 2 has one 1 ✓

Result: 3 (diagonal positions are all special)
```

### Example 3: No Special Positions

```dart
mat = [[1, 1, 0],
       [0, 0, 1],
       [1, 0, 0]]

Step 1: Horizontal scan
mapHorizontally = [[0,1], [2], [0]]
Row 0 has TWO 1s → can't be special

Step 2: Vertical scan
mapVertically = [[0,2], [0], [1]]
Col 0 has TWO 1s → any 1 there can't be special

Step 3: Check special positions
Row 0: has 2 ones ✗
Row 1: has 1 one at col 2
       But col 2 has only row 1... CHECK col 2
       mapVertically[2] = [1] → one 1 ✓
       result++

Row 2: has 1 one at col 0
       But col 0 has 2 ones [0,2] ✗

Result: 1
Only position (1,2) is special
```

---

## Key Insights

### Pre-computation Pattern

Instead of checking each cell repeatedly:

```dart
// BAD: O(m×n×(m+n))
for each cell (i,j):
    if cell is 1:
        check entire row → O(n)
        check entire column → O(m)
```

Pre-compute once, query many times:

```dart
// GOOD: O(m×n)
scan once → build maps
for each row with one 1:
    check column map → O(1)
```

### The List Length Trick

```dart
if (row.length == 1 && mapVertically[row.first].length == 1)
```

This elegantly checks:

- Row has exactly one 1? → `row.length == 1`
- Column has exactly one 1? → `mapVertically[...].length == 1`
- They're at the same position? → Guaranteed by construction

### Sparse Matrix Optimization

Your solution shines when the matrix is sparse (few 1s):

- Only stores actual 1 positions
- Empty rows/columns use no extra space
- Perfect for real-world data (often sparse)

---

## Alternative Approaches

### Count-Based Approach (More Common)

```dart
List<int> rowCounts = List.filled(m, 0);
List<int> colCounts = List.filled(n, 0);

// Count 1s in each row and column
for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
        if (mat[i][j] == 1) {
            rowCounts[i]++;
            colCounts[j]++;
        }
    }
}

// Find special positions
int result = 0;
for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
        if (mat[i][j] == 1 && rowCounts[i] == 1 && colCounts[j] == 1) {
            result++;
        }
    }
}
```

**Comparison:**

- Your approach: O(k) space, where k = number of 1s
- Count approach: O(m + n) space always
- **Your approach wins for sparse matrices**
- Count approach wins for dense matrices

Both are O(m × n) time, both beat 100% runtime.

---

## What I Learned

**Pre-computation eliminates redundancy.** Scan once, query many times beats scan-per-query.

**Position maps vs count arrays.** Both solve the problem. Choice depends on data sparsity.

**List length as a counter.** Clean way to check "exactly one" without explicit counting.

**Easy problems can have elegant solutions.** Your approach is more sophisticated than the standard one.

**5ms runtime proves it works.** Sometimes a less common approach is still optimal.

---

_Solved December 2, 2025_  
_Runtime: 5ms (100%)_  
_Memory: 151.85 MB (100%)_

[← Back to Solutions](../../) | [LeetCode](https://leetcode.com/problems/special-positions-in-a-binary-matrix/)
