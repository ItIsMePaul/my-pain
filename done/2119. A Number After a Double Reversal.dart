class Solution {
  bool isSameAfterReversals(int num) {
    String result = '';
    String reversedNum = num.toString();
    for (var i = reversedNum.split('').length - 1; i >= 0; i--) {
      result += reversedNum.split('')[i];
    }
    reversedNum = result;
    result = '';
    for (var i = reversedNum.split('').length - 1; i >= 0; i--) {
      result += reversedNum.split('')[i];
    }
    print(num);
    print(result);
    if (int.parse(result) == num) {
      return true;
    } else {
      return false;
    }
  }
}
