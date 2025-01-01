class Solution {
  int findGCD(List<int> nums) {
    nums.sort();
    int result = 0;
    int i = 1;
    int sn = nums.first;
    int ln = nums.last;
    while (sn >= i) {
      if (sn % i == 0 && ln % i == 0) {
        result = i;
      }
      i++;
    }
    return result;
  }
}
