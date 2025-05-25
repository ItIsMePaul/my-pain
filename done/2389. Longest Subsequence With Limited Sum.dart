class Solution {
  List<int> answerQueries(List<int> nums, List<int> queries) {
    nums.sort();
    List<int> ans = [];
    for (var i = 0; i < queries.length; i++) {
      int temp1 = 0;
      int temp2 = 0;
      for (var j = 0; j < nums.length; j++) {
        temp1 += nums[j];
        temp2++;
        if (queries[i] < temp1) {
          temp2--;
          break;
        }
      }
      ans.add(temp2);
    }
    return ans;
  }
}
