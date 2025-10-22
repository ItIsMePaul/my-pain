class Solution {
  List<int> sumEvenAfterQueries(List<int> nums, List<List<int>> queries) {
    int evenSum = 0;
    List<int> result = [];
    for (var i = 0; i < nums.length; i++) {
      if (nums[i] % 2 == 0) evenSum += nums[i];
    }
    for (var i = 0; i < queries.length; i++) {
      int val = queries[i][0];
      int pos = queries[i][1];
      if (nums[pos] % 2 == 0) {
        evenSum -= nums[pos];
        nums[pos] += val;
      } else {
        nums[pos] += val;
      }
      if (nums[pos] % 2 == 0) {
        evenSum += nums[pos];
      }
      result.add(evenSum);
    }
    return result;
  }
}
