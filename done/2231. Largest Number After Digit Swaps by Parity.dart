class Solution {
  int largestInteger(int num) {
    String numString = num.toString();
    for (var i = 0; i < numString.length - 1; i++) {
      int pos = i;
      int value = int.parse(numString[i]);
      if (value < 8) {
        for (var j = pos + 1; j < numString.length; j++) {
          int temp = int.parse(numString[j]);
          if (temp > value && temp % 2 == value % 2) {
            value = temp;
            pos = j;
            if (value >= 8) break;
          }
        }
      } else {
        continue;
      }
      if (i != pos) {
        numString = numString.replaceRange(pos, pos + 1, numString[i]);
        numString = numString.replaceRange(i, i + 1, value.toString());
      }
    }
    return int.parse(numString);
  }
}
