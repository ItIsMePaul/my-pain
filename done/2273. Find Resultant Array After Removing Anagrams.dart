class Solution {
  List<String> removeAnagrams(List<String> words) {
    for (var i = 1; i < words.length;) {
      Map<String, int> map1 = {};
      Map<String, int> map2 = {};
      for (int j = 0; j < words[i - 1].length; j++) {
        map1[words[i - 1][j]] = (map1[words[i - 1][j]] ?? 0) + 1;
      }
      for (int j = 0; j < words[i].length; j++) {
        map2[words[i][j]] = (map2[words[i][j]] ?? 0) + 1;
      }
      if (map1.length == map2.length) {
        bool isAnagram = true;
        for (var key in map1.keys) {
          if (map1[key] != map2[key]) {
            isAnagram = false;
            break;
          }
        }
        if (isAnagram) {
          words.removeAt(i);
        } else {
          i++;
        }
      } else {
        i++;
      }
    }
    return words;
  }
}
