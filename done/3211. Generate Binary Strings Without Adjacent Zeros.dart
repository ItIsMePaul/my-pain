class Solution {
  List<String> validStrings(int n) {
    List<String> ans = ['0', '1'];
    for (var i = 1; i < n; i++) {
      List<String> temp = [];
      for (var e in ans) {
        if (e[e.length - 1] != '0') {
          temp.add(e + '0');
        }
        temp.add(e + '1');
      }
      ans = temp;
    }
    return ans;
  }
}
