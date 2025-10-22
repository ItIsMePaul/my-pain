class Solution {
  List<int> executeInstructions(int n, List<int> startPos, String s) {
    List<int> result = List.filled(s.length, 0);
    for (var i = 0; i < s.length; i++) {
      List<int> pos = List.from(startPos);
      int temp = 0;
      for (var j = i; j < s.length; j++) {
        if (s[j] == 'U') {
          pos[0]--;
          if (pos[0] < 0) break;
        } else if (s[j] == 'D') {
          pos[0]++;
          if (pos[0] >= n) break;
        } else if (s[j] == 'R') {
          pos[1]++;
          if (pos[1] >= n) break;
        } else if (s[j] == 'L') {
          pos[1]--;
          if (pos[1] < 0) break;
        }
        temp++;
      }
      result[i] = temp;
    }
    return result;
  }
}
