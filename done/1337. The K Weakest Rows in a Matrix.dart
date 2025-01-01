class Solution {
  List<int> kWeakestRows(List<List<int>> mat, int k) {
    int powerOfTheRow(List<int> row) {
      int ans = 0;
      for (var e in row) {
        ans += e;
      }
      return ans;
    }

    int insertPosition(Map<int, int> map, List<int> values, int key) {
      if (values.isEmpty) {
        return 0;
      }
      for (var i = 0; i < values.length; i++) {
        if (map[key]! < values[i]) {
          return i;
        }
      }
      return values.length;
    }

    Map<int, int> ans = {};
    List<int> keys = [];
    List<int> values = [];
    for (var i = 0; i < mat.length; i++) {
      ans[i] = powerOfTheRow(mat[i]);
    }
    for (var e in ans.keys) {
      int insertPos = insertPosition(ans, values, e);
      values.insert(insertPos, ans[e]!);
      keys.insert(insertPos, e);
    }
    return keys.sublist(0, k);
  }
}
