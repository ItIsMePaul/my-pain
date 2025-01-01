class Solution {
  //Time Complexity O(n + q*m) Space Complexity O(n + q)
  List<bool> isArraySpecial(List<int> nums, List<List<int>> queries) {
    List<bool> ans = [];
    List<bool> temp = [];
    for (var i = 0; i < nums.length - 1; i++) {
      temp.add(nums[i] % 2 != nums[i + 1] % 2);
    }
    print(temp);
    for (var e in queries) {
      ans.add(!temp.sublist(e[0], e[1]).contains(false));
    }
    return ans;
  }
}

//Time Complexity O(n + q) Space Complexity O(n)
//Better solution
List<bool> isArraySpecial(List<int> nums, List<List<int>> queries) {
  final int n = nums.length;
  List<int> prefixSum = List.filled(n, 0);

  // Рахуємо префіксну суму порушень чергування парності
  for (int i = 1; i < n; i++) {
    prefixSum[i] = prefixSum[i - 1];
    if ((nums[i - 1] % 2) == (nums[i] % 2)) {
      prefixSum[i]++;
    }
  }

  // Обробляємо запити за O(1)
  return queries.map((q) {
    int violations = prefixSum[q[1]] - (q[0] > 0 ? prefixSum[q[0]] : 0);
    return violations == 0;
  }).toList();
}
