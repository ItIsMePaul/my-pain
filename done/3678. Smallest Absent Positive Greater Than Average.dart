class Solution {
  int smallestAbsent(List<int> nums) {
    double average = 0.0;
    for (var i = 0; i < nums.length; i++) {
      average += nums[i];
    }
    average = average / nums.length;
    int start = average.ceil();
    if (average % start == 0) start++;
    if (start <= 0) start = 1;
    Set<int> set = nums.toSet();
    while (set.contains(start)) {
      start++;
    }
    return start;
  }
}
