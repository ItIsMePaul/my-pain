import 'dart:collection';

class DataStream {
  Queue<int> queue = Queue();
  Map<int, int> map = {};
  late int value;
  late int k;
  DataStream(int value, int k) {
    this.k = k;
    this.value = value;
  }

  bool consec(int num) {
    queue.addLast(num);
    map[num] = (map[num] ?? 0) + 1;
    if (queue.length > k) {
      int removed = queue.removeFirst();
      map[removed] = map[removed]! - 1;
      if (map[removed]! <= 0) {
        map.remove(removed);
      }
    }
    if (value != num || map.length > 1 || queue.length < k) {
      return false;
    }
    return true;
  }
}
