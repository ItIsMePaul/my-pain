class Solution {
  int minTimeToType(String word) {
    int time = 0;
    String point = 'a';
    for (var i = 0; i < word.length; i++) {
      int pos1 = point.codeUnitAt(0);
      int pos2 = word[i].codeUnitAt(0);
      if (pos1 > pos2) {
        int temp1 = pos1 - pos2;
        int temp2 = 1;
        time += (temp1 > temp2 ? temp2 : temp1);
      }
      if (pos1 < pos2) {
        int temp1 = pos2 - pos1;
        int temp2 = 1;
        time += (temp1 > temp2 ? temp2 : temp1);
      }
      point = word[i];
      time++;
    }
    return time;
  }
}
