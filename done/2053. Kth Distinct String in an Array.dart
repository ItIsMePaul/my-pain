class Solution {
  String kthDistinct(List<String> arr, int k) {
    int count = 0;
    for (var i = 0; i < arr.length; i++) {
      String temp = arr.removeAt(i);
      if (!arr.contains(temp)) {
        count++;
        if (k == count) return temp;
      }
      arr.insert(i, temp);
    }
    return '';
  }
}
