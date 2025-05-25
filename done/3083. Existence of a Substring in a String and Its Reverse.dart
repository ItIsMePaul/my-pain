class Solution {
  bool isSubstringPresent(String s) {
    String rS = s.split('').reversed.join();
    for (var i = 0; i < s.length - 1; i++) {
      if (rS.contains(s.substring(i, i + 2))) {
        return true;
      }
    }
    return false;
  }
}
