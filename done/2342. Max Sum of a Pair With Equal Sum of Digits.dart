class Solution {
  int maximumSum(List<int> nums) {
    int _sumOfDigits(int num) {
      int sumOfNumDigits = 0;
      for (var i in num.toString().split('')) sumOfNumDigits += int.parse(i);
      return sumOfNumDigits;
    }

    int ans = -1;
    Map<int, List<int>> sumOfDigits = {};
    nums.sort();
    for (var i = 0; i < nums.length; i++) {
      int temp = _sumOfDigits(nums[i]);
      if (sumOfDigits.containsKey(temp)) {
        sumOfDigits[temp]!.add(nums[i]);
      } else {
        sumOfDigits[temp] = [nums[i]];
      }
    }

    for (var key in sumOfDigits.keys) {
      if (sumOfDigits[key]!.length > 1) {
        int temp = sumOfDigits[key]!.removeLast();
        temp += sumOfDigits[key]!.removeLast();
        if (temp > ans) ans = temp;
      }
    }
    return ans;
  }
}
