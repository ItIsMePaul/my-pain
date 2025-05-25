class Solution {
  List<int> lexicalOrder(int n) {
    List<String> list = [];
    for (var i = 1; i <= n; i++) list.add('$i');
    list.sort();
    List<int> result = [];
    for (var i = 0; i < list.length; i++) result.add(int.parse(list[i]));
    return result;
  }
}
