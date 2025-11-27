class Solution {
  List<List<int>> findDifference(List<int> n1, List<int> n2) {
    return [
      n1.toSet().difference(n2.toSet()).toList(),
      n2.toSet().difference(n1.toSet()).toList(),
    ];
  }

  List<List<int>> findDifferenceAnotherVariant(List<int> n1, List<int> n2) {
    for (var i = 0; i < n1.length; i++) {
      int temp = n1[i];
      if (n2.contains(temp)) {
        while (n1.contains(temp)) n1.remove(temp);
        while (n2.contains(temp)) n2.remove(temp);
        i--;
      }
    }
    return [n1.toSet().toList(), n2.toSet().toList()];
  }
}
