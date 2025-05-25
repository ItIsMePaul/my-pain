class Solution {
  List<String> wordSubsets(List<String> words1, List<String> words2) {
    Map<String, int> getFrequencyMap(String word) {
      Map<String, int> ans = {};
      for (var letter in word.split('')) {
        if (ans.containsKey(letter)) {
          ans[letter] = ans[letter]! + 1;
        } else {
          ans[letter] = 1;
        }
      }
      return ans;
    }

    Map<String, int> map2 = {};
    for (var word in words2) {
      Map<String, int> tempMap = getFrequencyMap(word);
      for (var newKey in tempMap.keys) {
        if (map2.containsKey(newKey)) {
          map2[newKey] = tempMap[newKey]! > map2[newKey]!
              ? tempMap[newKey]!
              : map2[newKey]!;
        } else {
          map2[newKey] = tempMap[newKey]!;
        }
      }
    }
    List<String> ans = [];
    outterLoop:
    for (var word in words1) {
      Map<String, int> tempMap = getFrequencyMap(word);
      for (var key in map2.keys) {
        if (!tempMap.containsKey(key) || tempMap[key]! < map2[key]!) {
          continue outterLoop;
        }
      }
      ans.add(word);
    }
    return ans;
  }
}
