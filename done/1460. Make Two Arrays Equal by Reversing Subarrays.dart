class Solution {
  bool canBeEqual(List<int> target, List<int> arr) {
    for (var i = 0; i < target.length;) {
      if (arr.contains(target[i])) {
        arr.remove(target[i]);
        target.removeAt(i);
      } else {
        return false;
      }
    }
    return true;
  }
}
