class Solution {
  List<int> sortByBits(List<int> arr) {
    Map<int, List<int>> bits = {};
    for (var num in arr) {
      String temp = num.toRadixString(2);
      int count = 0;
      for (var i = 0; i < temp.length; i++) {
        if (temp[i] == '1') count++;
      }
      if (bits[count] != null) {
        bits[count]!.add(num);
      } else {
        bits[count] = [num];
      }
    }
    bits = Map.fromEntries(
        bits.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
    List<int> ans = [];
    for (var key in bits.keys) {
      bits[key]!.sort();
      ans.addAll(bits[key]!);
    }
    return ans;
  }
}
