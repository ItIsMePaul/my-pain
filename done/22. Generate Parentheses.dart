class Solution {
  List<String> generateParenthesis(int n) {
    List<String> result = ['('];
    while (result.last.length < n * 2) {
      List<String> temp = [];
      for (var i = 0; i < result.length; i++) {
        int closed = 0;
        int open = 0;
        int level = 0;
        for (var j = 0; j < result[i].length; j++) {
          if (result[i][j] == '(') {
            open++;
            level++;
          }
          if (result[i][j] == ')') {
            closed++;
            level--;
          }
        }
        if (closed < n && (level - 1) >= 0) temp.add(result[i] + ')');
        if (open < n) temp.add(result[i] + '(');
      }
      result.clear();
      result.addAll(temp);
    }
    return result;
  }
}
