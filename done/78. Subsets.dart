class Solution {
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> results = [[]];
    for (var num in nums) {
      List<List<int>> temp = [];
      for (var i = 0; i < results.length; i++) {
        temp.add(results[i]);
        temp.add([...results[i], num]);
      }
      results
        ..clear()
        ..addAll(temp);
    }
    return results;
  }
}

void main() {
  Solution().subsets([1, 2, 3]);
}
