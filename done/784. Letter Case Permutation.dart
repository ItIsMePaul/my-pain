class Solution {
  List<String> letterCasePermutation(String s) {
    List<String> res = [s];
    for (var i = 0; i < s.length; i++) {
      if (RegExp(r'[a-zA-Z]').hasMatch(s[i])) {
        List<String> temp = [];
        for (var newWord in res) {
          temp.add(
            newWord.substring(0, i) +
                (s[i] == s[i].toLowerCase()
                    ? s[i].toUpperCase()
                    : s[i].toLowerCase()) +
                newWord.substring(i + 1),
          );
          temp.add(newWord);
        }
        res.clear();
        res.addAll(temp);
      }
    }
    return res;
  }
}
