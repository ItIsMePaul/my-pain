import 'dart:math';

class RandomizedSet {
  Set<int> set = {};
  RandomizedSet();

  bool insert(int val) {
    return set.add(val);
  }

  bool remove(int val) {
    return set.remove(val);
  }

  int getRandom() {
    return set.elementAt(Random().nextInt(set.length));
  }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * RandomizedSet obj = RandomizedSet();
 * bool param1 = obj.insert(val);
 * bool param2 = obj.remove(val);
 * int param3 = obj.getRandom();
 */