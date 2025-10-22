class Solution {
  String complexNumberMultiply(String num1, String num2) {
    int r1 = int.parse(num1.substring(0, num1.indexOf('+')));
    int i1 = int.parse(num1.substring(num1.indexOf('+') + 1, num1.length - 1));
    int r2 = int.parse(num2.substring(0, num2.indexOf('+')));
    int i2 = int.parse(num2.substring(num2.indexOf('+') + 1, num2.length - 1));
    return '${r1 * r2 - i1 * i2}+${r1 * i2 + i1 * r2}i';
  }
}
