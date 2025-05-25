class MapSum {
  Map<String, int> map = {};
  MapSum();

  void insert(String key, int val) {
    map[key] = val;
  }

  int sum(String prefix) {
    int ans = 0;
    for (var key in map.keys) {
      if (key.startsWith(prefix)) {
        ans += map[key]!;
      }
    }
    return ans;
  }
}

/**
 * Your MapSum object will be instantiated and called as such:
 * MapSum obj = MapSum();
 * obj.insert(key,val);
 * int param2 = obj.sum(prefix);
 */