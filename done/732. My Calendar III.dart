import 'dart:collection';

class MyCalendarThree {
  SplayTreeMap<int, int> map = SplayTreeMap();
  int ans = 0;
  MyCalendarThree() {}

  int book(int startTime, int endTime) {
    map[startTime] = (map[startTime] ?? 0) + 1;
    map[endTime] = (map[endTime] ?? 0) - 1;
    int active = 0;
    for (var value in map.values) {
      active += value;
      ans = ans > active ? ans : active;
    }
    return ans;
  }
}

/**
 * Your MyCalendarThree object will be instantiated and called as such:
 * MyCalendarThree obj = MyCalendarThree();
 * int param1 = obj.book(startTime,endTime);
 */
