class Solution {
  String maximumTime(String time) {
    if (time[0] == '?') {
      if (time[1] == '?' || int.parse(time[1]) <= 3) {
        time = time.replaceRange(0, 1, '2');
      } else {
        time = time.replaceRange(0, 1, '1');
      }
    }
    if (time[1] == '?') {
      if (time[0] == '2') {
        time = time.replaceRange(1, 2, '3');
      } else {
        time = time.replaceRange(1, 2, '9');
      }
    }
    if (time[3] == '?') {
      time = time.replaceRange(3, 4, '5');
    }
    if (time[4] == '?') {
      time = time.replaceRange(4, 5, '9');
    }

    return time;
  }
}
