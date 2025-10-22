class Solution {
  List<int> sortedSquares(List<int> nums) {
    List<int> results = [];
    for (var e in nums) {
      results.add(e * e);
    }
    results.sort();
    return results;
  }
}
