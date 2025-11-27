class Solution {
  List<List<int>> threeSum(List<int> nums) {
    List<List<int>> result = [];
    List<String> ts = [];
    for (var i = 0; i < nums.length - 2; i++) {
      for (var j = i + 1; j < nums.length - 1; j++) {
        for (var k = j + 1; k < nums.length; k++) {
          if (nums[i] + nums[j] + nums[k] == 0) {
            List<int> tr = [nums[i], nums[j], nums[k]];
            tr.sort();
            if (!ts.contains(tr.join(''))) {
              ts.add(tr.join(''));
              result.add(tr);
            }
          }
        }
      }
    }
    return result;
  }
}
