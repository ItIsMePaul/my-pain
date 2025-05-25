class Solution {
  int minMaxDifference(int num) {
    String minNum = num.toString();
    String maxNum = num.toString();
    minNum = minNum.replaceAll(minNum[0], '0');
    String char = maxNum[0];
    for (var i = 0; i < maxNum.length; i++) {
      if (maxNum[i] != '9') {
        char = maxNum[i];
        break;
      }
    }
    maxNum = maxNum.replaceAll(char, '9');
    return int.parse(maxNum) - int.parse(minNum);
  }
}
