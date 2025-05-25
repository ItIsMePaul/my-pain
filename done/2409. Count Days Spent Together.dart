class Solution {
  int? countDaysTogether(
    String arriveAlice,
    String leaveAlice,
    String arriveBob,
    String leaveBob,
  ) {
    int _dateParse(bool mode, String data) {
      List<int> monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
      if (mode) {
        int month = int.parse(data);
        int days = 0;
        for (var i = 0; i < month - 1; i++) days += monthDays[i];
        return days;
      } else {
        return int.parse(data);
      }
    }

    int _countDays(String s) {
      bool parseMode = true;
      int days = 0;
      for (var data in s.split('-')) {
        days += _dateParse(parseMode, data);
        parseMode = !parseMode;
      }
      return days;
    }

    List<int> alice = [_countDays(arriveAlice), _countDays(leaveAlice)];
    List<int> bob = [_countDays(arriveBob), _countDays(leaveBob)];
    int start = alice[0] > bob[0] ? alice[0] : bob[0];
    int end = alice[1] < bob[1] ? alice[1] : bob[1];
    if (end < start) return 0;
    return end - start + 1;
  }
}
