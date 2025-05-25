class Solution {
  List<int> numSmallerByFrequency(List<String> queries, List<String> words) {
    int f(String word) {
      Map<int, int> frequency = {};
      int letter = 173;
      for (var num in word.codeUnits) {
        frequency[num] = (frequency[num] ?? 0) + 1;
        if (num < letter) letter = num;
      }
      return frequency[letter]!;
    }

    List<int> frequencyOfWords = [];
    for (var word in words) frequencyOfWords.add(f(word));
    List<int> answer = [];
    for (var query in queries) {
      int res = 0;
      int frequencyOfQuery = f(query);
      for (var frequencyOfWord in frequencyOfWords) {
        if (frequencyOfQuery < frequencyOfWord) res++;
      }
      answer.add(res);
    }
    return answer;
  }
}

void main() {
  Solution().numSmallerByFrequency(["bbb", "cc"], ["a", "aa", "aaa", "aaaa"]);
}
