class Solution {
  int minimumSumI(int num) {
    List<String> rightShift(List<String> nums) {
      List<String> ans = [];
      ans.add(nums.last);
      ans.addAll(nums.sublist(0, nums.length - 1));
      return ans;
    }

    List<String> nums = [];
    for (var e in num.toString().split('')) {
      if (e != '0') {
        nums.add(e);
      }
    }
    if (nums.length == 1) return int.parse(nums[0]);

    int i = 0;
    int ans = 200;
    while (i < nums.length + 2) {
      String num1 = '';
      String num2 = '';
      nums = rightShift(nums);
      for (var j = 0; j < nums.length; j++) {
        if (j < nums.length ~/ 2) {
          num1 += nums[j];
        } else {
          num2 += nums[j];
        }
      }
      int temp1 = int.parse(num1) + int.parse(num2);
      num1 = num1.split('').reversed.join('');
      int temp2 = int.parse(num1) + int.parse(num2);
      num2 = num2.split('').reversed.join('');
      int temp3 = int.parse(num1) + int.parse(num2);
      if (ans > temp1 || ans > temp2 || ans > temp3) {
        if (ans > temp1) ans = temp1;
        if (ans > temp2) ans = temp2;
        if (ans > temp3) ans = temp3;
      }
      i++;
    }
    return ans;
  }
}
