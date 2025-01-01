class Solution {
  List<String> cellsInRange(String s) {
    int startLetterCode = s[0].codeUnits[0];
    int stopLetterCode = s[3].codeUnits[0];
    int startNumber = int.parse(s[1]);
    int stopNumber = int.parse(s[4]);
    List<String> ans = [];
    for (var i = startLetterCode; i <= stopLetterCode; i++) {
      for (var j = startNumber; j <= stopNumber; j++) {
        ans.add('${String.fromCharCode(i)}${j}');
      }
    }
    return ans;
  }
}
