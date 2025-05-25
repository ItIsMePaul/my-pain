class Solution {
  List<int> processQueries(List<int> queries, int m) {
    List<int> arr = List.generate(m, (int index) => index + 1);
    List<int> ans = [];
    for (var num in queries) {
      int index = arr.indexOf(num);
      arr.insert(0, arr[index]);
      arr.removeAt(index + 1);
      ans.add(index);
    }
    return ans;
  }
}
