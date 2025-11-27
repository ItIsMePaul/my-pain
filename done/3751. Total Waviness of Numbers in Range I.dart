class Solution {
  int totalWaviness(int num1, int num2) {
    int result = 0;
    for (var i = num1; i <= num2; i++) {
      String number = i.toString();
      for (var i = 1; i < number.length - 1; i++) {
        List<int> temp = number.codeUnits;
        if ((temp[i - 1] > temp[i] && temp[i] < temp[i + 1]) ||
            (temp[i - 1] < temp[i] && temp[i] > temp[i + 1]))
          result++;
      }
    }
    return result;
  }
}
