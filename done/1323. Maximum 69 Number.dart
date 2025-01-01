class Solution {
  int maximum69Number(int num) {
    int ans = num;
    for (var i = 0; i < num.toString().length; i++) {
      String num1 = num.toString();
      String replace = num1[i] == '9' ? '6' : '9';
      String num2 = num1.replaceRange(i, i + 1, replace);
      int temp =
          int.parse(num1) > int.parse(num2) ? int.parse(num1) : int.parse(num2);
      ans = temp > ans ? temp : ans;
    }
    return ans;
  }
}
