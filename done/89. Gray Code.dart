import 'dart:math';

class Solution {
  List<int> grayCode(int n) {
    List<int> result = [];
    for (var i = 0; i < pow(2, n); i++) {
      String binary = i.toRadixString(2);
      StringBuffer gray = StringBuffer();
      gray.write(binary[0]);
      for (var j = 1; j < binary.length; j++) {
        gray.write((int.parse(binary[j - 1]) ^ int.parse(binary[j])).toString());
      }
      result.add(int.parse(gray.toString(), radix: 2));
    }
    return result;
  }
}
