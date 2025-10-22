class Solution {
  List<String> partitionString(String s) {
    Set<String> result = {};
    int index = 0;
    int size = 1;
    while (index + size <= s.length) {
      String temp = s.substring(index, index + size);
      if (!result.contains(temp)) {
        index += size;
        size = 1;
        result.add(temp);
      } else {
        size++;
      }
    }
    return result.toList();
  }
}
