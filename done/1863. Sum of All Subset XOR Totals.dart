class Solution {
  int subsetXORSum(List<int> nums) {
    List<List<int>> _subsets(List<int> nums) {
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

    List<List<int>> subsets = _subsets(nums);
    int result = 0;
    for (var set in subsets) {
      int temp = 0;
      for (var element in set) temp ^= element;
      result += temp;
    }

    return result;
  }
}
