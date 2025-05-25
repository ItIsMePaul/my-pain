import 'dart:collection';

class MyCalendarTwo {
  SplayTreeMap<int, int> map = SplayTreeMap();
  MyCalendarTwo() {}

  bool book(int startTime, int endTime) {
    map[startTime] = (map[startTime] ?? 0) + 1;
    map[endTime] = (map[endTime] ?? 0) - 1;
    int active = 0;
    for (var time in map.keys) {
      active += map[time]!;
      if (active >= 3) {
        map[startTime] = (map[startTime] ?? 0) - 1;
        map[endTime] = (map[endTime] ?? 0) + 1;
        return false;
      }
    }
    return true;
  }
}

/**
 * Your MyCalendarTwo object will be instantiated and called as such:
 * MyCalendarTwo obj = MyCalendarTwo();
 * bool param1 = obj.book(startTime,endTime);
 */
