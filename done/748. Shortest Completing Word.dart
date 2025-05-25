class Solution {
  String shortestCompletingWord(String licensePlate, List<String> words) {
    Map<String, int> _countCharacters(String word) {
      Map<String, int> ans = {};
      for (var i = 0; i < word.length; i++)
        ans[word[i]] = (ans[word[i]] ?? 0) + 1;
      return ans;
    }

    words.sort((a, b) => a.length.compareTo(b.length));
    licensePlate = licensePlate.toLowerCase();
    licensePlate = licensePlate.replaceAll(RegExp(r'\d'), '');
    licensePlate = licensePlate.replaceAll(' ', '');
    Map<String, int> plate = {};
    for (var i = 0; i < licensePlate.length; i++)
      plate[licensePlate[i]] = (plate[licensePlate[i]] ?? 0) + 1;
    print(plate);
    main:
    for (var word in words) {
      Map<String, int> temp = _countCharacters(word);
      for (var key in plate.keys) {
        if (!temp.containsKey(key) ||
            (temp.containsKey(key) && temp[key]! > plate[key]!)) {
          continue main;
        }
      }
      return word;
    }
    return '';
  }
}
