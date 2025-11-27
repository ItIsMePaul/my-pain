class Solution {
  bool uniqueOccurrences(List<int> arr) {
    List<int> results = [];
    for (var e in arr.toSet()) {
      int temp = 0;
      while (arr.contains(e)) {
        arr.remove(e);
        temp++;
      }
      if (results.contains(temp)) {
        return false;
      } else {
        results.add(temp);
      }
    }
    return true;
  }
}
