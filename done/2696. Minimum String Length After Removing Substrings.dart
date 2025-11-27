class Solution {
  int minLength(String s) {
    int i = 0;
    List<String> list = s.split('');
    while (true) {
      if (i >= list.length - 1) {
        break;
      }
      if ((list[i] == 'A' && list[i + 1] == 'B') ||
          (list[i] == 'C' && list[i + 1] == 'D')) {
        list.removeAt(i + 1);
        list.removeAt(i);
        i = 0;
        continue;
      }
      i++;
    }
    return list.length;
  }
}
