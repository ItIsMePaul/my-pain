class Solution {
  bool checkDistances(String s, List<int> distance) {
    for (var i = 0; i < distance.length; i++) {
      if (s.contains(String.fromCharCode(97 + i))) {
        int temp1 = s.indexOf(String.fromCharCode(97 + i));
        int temp2 = s.lastIndexOf(String.fromCharCode(97 + i));
        if (temp2 - temp1 - 1 != distance[i]) {
          return false;
        }
      }
    }
    return true;
  }
}
