class Solution {
  int compareVersion(String version1, String version2) {
    List<int> v1 = [];
    for (var num in version1.split('.')) v1.add(int.parse(num));
    List<int> v2 = [];
    for (var num in version2.split('.')) v2.add(int.parse(num));
    int index = 0;
    while (v1.length > index && v2.length > index) {
      if (v1[index] == v2[index]) {
        index++;
        continue;
      }
      if (v1[index] < v2[index]) {
        return -1;
      } else {
        return 1;
      }
    }
    if (v1.length < v2.length) {
      while (v2.length > index) if (v2[index++] != 0) return -1;
    } else if (v1.length > v2.length) {
      while (v1.length > index) if (v1[index++] != 0) return 1;
    }
    return 0;
  }
}
