class Solution {
  List<String> buildArray(List<int> target, int n) {
    List<String> result = [];
    int j = 0;
    for (var i = 1; i <= n; i++) {
      if (target[j] == i) {
        result.add('Push');
        j++;
      } else {
        result.addAll(['Push', 'Pop']);
      }
      if (target.last == i) break;
    }
    return result;
  }
}
