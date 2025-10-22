class Solution {
  String predictPartyVictory(String senate) {
    int removeR = 0;
    int removeD = 0;
    Map<String, int> map = {'R': 0, 'D': 0};
    for (var i = 0; i < senate.length; i++) {
      map[senate[i]] = (map[senate[i]] ?? 0) + 1;
    }
    List<String> queue = senate.split('');
    int index = 0;
    while (map['R']! > 0 && map['D']! > 0) {
      if (queue[index] == 'R') {
        if (removeR > 0) {
          removeR--;
          map['R'] = map['R']! - 1;
        } else {
          removeD++;
          queue.add('R');
        }
      } else {
        if (removeD > 0) {
          removeD--;
          map['D'] = map['D']! - 1;
        } else {
          removeR++;
          queue.add('D');
        }
      }
      queue.removeAt(0);
    }
    return map['R']! > 0 ? 'Radiant' : 'Dire';
  }
}
