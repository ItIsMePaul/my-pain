class Solution {
  int countCharacters(List<String> words, String chars) {
    Map<String, int> charMap = {};
    for (var i = 0; i < chars.length; i++) {
      charMap[chars[i]] = (charMap[chars[i]] ?? 0) + 1;
    }
    int ans = 0;
    loop1:
    for (var word in words) {
      Map<String, int> tempMap = {};
      for (var i = 0; i < word.length; i++) {
        if (!charMap.containsKey(word[i])) continue loop1;
        tempMap[word[i]] = (tempMap[word[i]] ?? 0) + 1;
      }
      for (var char in tempMap.keys) {
        if (tempMap[char]! > charMap[char]!) continue loop1;
      }
      ans += word.length;
    }
    return ans;
  }
}
