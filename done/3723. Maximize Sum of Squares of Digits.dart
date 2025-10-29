class Solution {
  String maxSumOfSquares(int num, int sum) {
    if (sum > 9 * num) return "";
    List<String> digits = [];
    int temp = sum ~/ 9;
    digits.add('9' * temp);
    num -= temp;
    temp = sum % 9;
    if (temp > 0) {
      digits.add(temp.toString());
      num--;
    }
    digits.add('0' * num);
    return digits.join();
  }
}
