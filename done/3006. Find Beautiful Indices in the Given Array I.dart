class Solution {
  List<int> beautifulIndices(String s, String a, String b, int k) {
    List<int> indexesOfA = [];
    List<int> indexesOfB = [];
    List<int> ans = [];
    int n = s.indexOf(a);
    while (n >= 0) {
      indexesOfA.add(n);
      n = s.indexOf(a, n + 1);
    }
    n = s.indexOf(b);
    while (n >= 0) {
      indexesOfB.add(n);
      n = s.indexOf(b, n + 1);
    }
    for (var i = 0; i < indexesOfA.length; i++) {
      for (var j = 0; j < indexesOfB.length; j++) {
        int temp = (indexesOfA[i] - indexesOfB[j]).abs();
        if (temp <= k) {
          ans.add(indexesOfA[i]);
          break;
        }
      }
    }
    return ans;
  }
}
