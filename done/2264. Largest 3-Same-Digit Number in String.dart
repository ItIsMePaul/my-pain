class Solution {
  String largestGoodInteger(String n) {
    bool firstNumberFound = false;
    String result = '';
    int foundNumber = -1;
    for (var i = 0; i < n.length - 2; i++) {
      if (n[i] == n[i + 1] && n[i] == n[i + 2]) {
        if (!firstNumberFound ||
            int.parse(n.substring(i, i + 3)) >= foundNumber) {
          result = n.substring(i, i + 3);
          firstNumberFound = true;
          foundNumber = int.parse(n.substring(i, i + 3));
        }
      }
    }
    return result;
  }
}
