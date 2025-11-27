import 'dart:collection';

class MKAverage {
  final int m;
  final int k;
  int sum = 0;
  SplayTreeMap<int, int> map = SplayTreeMap();
  Queue<int> queue = Queue();

  MKAverage(this.m, this.k);

  void addElement(int num) {
    sum += num;
    queue.add(num);
    map[num] = (map[num] ?? 0) + 1;
    if (queue.length > m) {
      int temp = queue.removeFirst();
      map[temp] = map[temp]! - 1;
      if (map[temp] == 0) map.remove(temp);
      sum -= temp;
    }
  }

  int calculateMKAverage() {
    if (queue.length < m) return -1;
    int sumOfBiggest = 0;
    int sumOfSmallest = 0;
    int smallestRemoved = k;
    int biggestRemoved = k;
    List<int> keys = map.keys.toList();
    for (var i = 0; i <= keys.length ~/ 2; i++) {
      if (smallestRemoved != 0) {
        if (map[keys[i]]! <= smallestRemoved) {
          smallestRemoved -= map[keys[i]]!;
          sumOfSmallest += keys[i] * map[keys[i]]!;
        } else {
          sumOfSmallest += keys[i] * smallestRemoved;
          smallestRemoved = 0;
        }
      }
      if (biggestRemoved != 0) {
        if (map[keys[keys.length - 1 - i]]! <= biggestRemoved) {
          biggestRemoved -= map[keys[keys.length - 1 - i]]!;
          sumOfBiggest +=
              keys[keys.length - 1 - i] * map[keys[keys.length - 1 - i]]!;
        } else {
          sumOfBiggest += keys[keys.length - 1 - i] * biggestRemoved;
          biggestRemoved = 0;
        }
      }
      if (smallestRemoved == 0 && biggestRemoved == 0) {
        break;
      }
    }
    return ((sum - sumOfSmallest - sumOfBiggest) / (queue.length - 2 * k))
        .floor();
  }
}

/**
 * Your MKAverage object will be instantiated and called as such:
 * MKAverage obj = MKAverage(m, k);
 * obj.addElement(num);
 * int param2 = obj.calculateMKAverage();
 */
