class Solution {
  List<int> minOperations(String boxes) {
    List<int> ans = [];
    for (var i = 0; i < boxes.length; i++) {
      ans.add(0);
      for (var j = 0; j < boxes.length; j++) {
        if (i != j && boxes[j] == '1') {
          ans[i] += (i - j).abs();
        }
      }
    }
    return ans;
  }
}
