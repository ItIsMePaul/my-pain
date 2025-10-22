class Solution {
  int maxFreqSum(String s) {
    Set<String> set = {'a', 'e', 'i', 'o', 'u'};
    Map<String, int> mapVowels = {};
    Map<String, int> mapConsonants = {};
    int maxFrequentVowels = 0;
    int maxFrequentConsonants = 0;
    for (var i = 0; i < s.length; i++) {
      if (set.contains(s[i])) {
        mapVowels[s[i]] = (mapVowels[s[i]] ?? 0) + 1;
        if (mapVowels[s[i]]! > maxFrequentVowels) {
          maxFrequentVowels = mapVowels[s[i]]!;
        }
      } else {
        mapConsonants[s[i]] = (mapConsonants[s[i]] ?? 0) + 1;
        if (mapConsonants[s[i]]! > maxFrequentConsonants) {
          maxFrequentConsonants = mapConsonants[s[i]]!;
        }
      }
    }
    return maxFrequentVowels + maxFrequentConsonants;
  }
}
