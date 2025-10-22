import 'dart:collection';

class NumberContainers {
  Map<int, int> map = {};
  Map<int, SplayTreeSet<int>> storage = {};
  NumberContainers() {}

  void change(int index, int number) {
    int taken = map[index] ?? -1;
    if (taken == -1) {
      map[index] = number;
      if (!storage.containsKey(number)) storage[number] = SplayTreeSet();
      storage[number]!.add(index);
    } else {
      storage[map[index]!]!.remove(index);
      if (storage[map[index]!]!.isEmpty) storage.remove(map[index]!);
      map[index] = number;
      if (!storage.containsKey(number)) storage[number] = SplayTreeSet();
      storage[number]!.add(index);
    }
  }

  int find(int number) {
    return (storage[number] ?? {-1}).first;
  }
}

/**
 * Your NumberContainers object will be instantiated and called as such:
 * NumberContainers obj = NumberContainers();
 * obj.change(index,number);
 * int param2 = obj.find(number);
 */
