class Solution {
  List<String> letterCombinations(String digits) {
    Map<String, String> map = {
      '2': 'abc',
      '3': 'def',
      '4': 'ghi',
      '5': 'jkl',
      '6': 'mno',
      '7': 'pqrs',
      '8': 'tuv',
      '9': 'wxyz',
    };
    List<String> ans = [];
    for (var i = 0; i < digits.length; i++) {
      List<String> temp = [];
      for (var j = 0; j < map[digits[i]]!.length; j++) {
        for (var n = 0; n < (ans.isEmpty ? 1 : ans.length); n++) {
          temp.add((ans.isEmpty ? '' : ans[n]) + map[digits[i]]![j]);
        }
      }
      ans.clear();
      ans.addAll(temp);
    }
    return ans;
  }
}
