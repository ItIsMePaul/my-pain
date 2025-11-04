class Solution {
  int maxProduct(List<int> nums) {
    nums.sort();
    int firstCase = nums.first * nums.last;
    int secondCase = nums[0] * nums[1];
    int thirdCase = nums[nums.length - 1] * nums[nums.length - 2];
    int result = firstCase * 100000;
    result = result > firstCase * -100000 ? result : firstCase * -100000;
    result = result > secondCase * 100000 ? result : secondCase * 100000;
    result = result > secondCase * -100000 ? result : secondCase * -100000;
    result = result > thirdCase * 100000 ? result : thirdCase * 100000;
    result = result > thirdCase * -100000 ? result : thirdCase * -100000;
    return result;
  }
}
