import 'dart:collection';

class AllOne {
  Map<String, int> map = {};
  SplayTreeMap<int, Set<String>> storage = SplayTreeMap();
  AllOne() {}

  void inc(String key) {
    if (map.containsKey(key)) {
      storage[map[key]]!.remove(key);
      if (storage[map[key]]!.isEmpty) storage.remove(map[key]);
      map[key] = map[key]! + 1;
    } else {
      map[key] = 1;
    }
    if (storage.containsKey(map[key])) {
      storage[map[key]]!.add(key);
    } else {
      storage[map[key]!] = {key};
    }
  }

  void dec(String key) {
    storage[map[key]]!.remove(key);
    if (storage[map[key]]!.isEmpty) storage.remove(map[key]);
    map[key] = map[key]! - 1;
    if (map[key] == 0) {
      map.remove(key);
    } else {
      if (storage.containsKey(map[key])) {
        storage[map[key]]!.add(key);
      } else {
        storage[map[key]!] = {key};
      }
    }
  }

  String getMaxKey() {
    if (storage.isEmpty) return '';
    return storage[storage.keys.last]!.first;
  }

  String getMinKey() {
    if (storage.isEmpty) return '';
    return storage[storage.keys.first]!.first;
  }
}

/**
 * Your AllOne object will be instantiated and called as such:
 * AllOne obj = AllOne();
 * obj.inc(key);
 * obj.dec(key);
 * String param3 = obj.getMaxKey();
 * String param4 = obj.getMinKey();
 */
