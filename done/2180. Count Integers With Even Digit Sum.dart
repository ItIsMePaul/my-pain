class Solution {
  int countEven(int num) {
    int result = 0;
    for (var i = 1; i <= num; i++) {
      List<String> str = i.toString().split('');
      int sum = 0;
      for (var e in str) {
        sum += int.parse(e);
      }
      if (sum % 2 == 0) result++;
    }
    return result;
  }
}
