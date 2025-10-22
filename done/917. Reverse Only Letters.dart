class Solution {
  String reverseOnlyLetters(String s) {
    String result = '';
    List<String> string = s.split('');
    List<String> rstring = [];
    for (var i = string.length - 1; i >= 0; i--) {
      if ((string[i].codeUnits[0] >= 65 && string[i].codeUnits[0] <= 90) ||
          (string[i].codeUnits[0] >= 97 && string[i].codeUnits[0] <= 122)) {
        rstring.add(string[i]);
      }
    }
    int j = 0;
    for (var i = 0; i < string.length; i++) {
      if ((string[i].codeUnits[0] >= 65 && string[i].codeUnits[0] <= 90) ||
          (string[i].codeUnits[0] >= 97 && string[i].codeUnits[0] <= 122)) {
        result += rstring[j];
        j++;
      } else {
        result += '-';
      }
    }
    return result;
  }
}
