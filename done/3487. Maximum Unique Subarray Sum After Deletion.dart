class Solution {
  int maxSum(List<int> nums) {
    Set<int> numbers = nums.toSet();
    bool positive = false;
    int negativeMaxNumber = -100;
    int maxSum = 0;
    for (var number in numbers) {
      if (number.isNegative) {
        if (number > negativeMaxNumber) {
          negativeMaxNumber = number;
        }
      } else {
        positive = true;
        maxSum += number;
      }
    }
    return positive ? maxSum : negativeMaxNumber;
  }
}
