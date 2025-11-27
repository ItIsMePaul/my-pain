class Solution {
  String? nextGreatestLetter(List<String> letters, String target) {
    if (letters.last.codeUnits[0] < target.codeUnits[0]) {
      return letters[0];
    } else {
      for (var e in letters) {
        if (e.codeUnits[0] > target.codeUnits[0]) {
          return e;
        }
      }
    }
  }
}
