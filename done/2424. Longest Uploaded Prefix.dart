class LUPrefix {
  late List<int> store;
  int firstNegative = 0;
  LUPrefix(int n) {
    store = List.filled(n, -1);
  }

  void upload(int video) {
    store[video - 1] = video;
    if (firstNegative == video - 1) firstNegative = store.indexOf(-1);
  }

  int longest() {
    return firstNegative != -1 ? firstNegative : store.length;
  }
}

/**
 * Your LUPrefix object will be instantiated and called as such:
 * LUPrefix obj = LUPrefix(n);
 * obj.upload(video);
 * int param2 = obj.longest();
 */
