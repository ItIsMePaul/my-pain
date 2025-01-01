class Solution {
  bool canMakeSubsequence(String str1, String str2) {
    int decreaseCode(int num) => num == 97 ? 122 : num - 1;

    int j = 0;
    for (var i = 0; i < str1.length && j != str2.length; i++) {
      if (str1[i] == str2[j] ||
          str1[i].codeUnits[0] == decreaseCode(str2[j].codeUnits[0])) {
        j++;
      }
    }
    if (str2.length == j) {
      return true;
    } else {
      return false;
    }
  }
}
