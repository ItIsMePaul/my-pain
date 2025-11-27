class Solution {
  bool judgeCircle(String moves) {
    List<int> res = [0, 0];
    for (var e in moves.split('')) {
      switch (e) {
        case 'U':
          res[0]++;
        case 'D':
          res[0]--;
        case 'R':
          res[1]++;
        case 'L':
          res[1]--;
      }
    }
    return (res[0] == 0 && res[1] == 0);
  }
}
