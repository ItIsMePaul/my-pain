class Solution {
  List<int> maxSubsequence(List<int> nums, int k) {
    int maxInArray(List<int> array) {
      int max = -100001;
      int pos = -1;
      for (var i = 0; i < array.length; i++) {
        if (array[i] > max) {
          max = array[i];
          pos = i;
        }
      }
      return pos;
    }

    if (nums.length == k) {
      return nums;
    }
    List<int> temp1 = [];
    List<int> temp2 = List.from(nums);
    for (var i = 0; i < k; i++) {
      int pos = maxInArray(temp2);
      temp1.add(temp2[pos]);
      temp2.removeAt(pos);
    }
    List<int> ans = [];
    for (var e in nums) {
      if (temp1.contains(e)) {
        ans.add(e);
        temp1.remove(e);
      }
    }
    return ans;
  }
}
