class Solution {
  List<List<int>> divideArray(List<int> nums, int k) {
    nums.sort();
    List<List<int>> result = [];
    for (var i = 0; i < nums.length ~/ 3; i++) {
      List<int> subArray = nums.sublist(i * 3, i * 3 + 3);
      if (subArray.last - subArray.first <= k) {
        result.add(subArray);
      } else {
        return [];
      }
    }
    return result;
  }
}

void main() {
  Solution solution = Solution();
  List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int k = 3;
  List<List<int>> result = solution.divideArray(nums, k);
  print(result); // Expected output: [[1,2,3],[4,5,6],[7,8,9]]
}
