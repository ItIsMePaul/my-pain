class Solution {
  String convertToTitle(int columnNumber) {
    String ans = '';
    List<int> letterCode = [];
    while (true) {
      if (columnNumber <= 26) {
        letterCode.add(columnNumber);
        break;
      } else {
        columnNumber--;
        ans += String.fromCharCode(columnNumber % 26 + 1 + 64);
        columnNumber = columnNumber ~/ 26;
      }
    }
    for (var i = letterCode.length - 1; i >= 0; i--) {
      ans += String.fromCharCode(letterCode[i] + 64);
    }
    return ans;
  }
}
