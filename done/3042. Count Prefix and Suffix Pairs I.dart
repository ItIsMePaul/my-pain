class Solution {
  int countPrefixSuffixPairs(List<String> words) {
    bool isPrefixAndSuffix(String str1, String str2) {
      if (str2.length >= str1.length) {
        String temp1 = str2.substring(0, str1.length);
        String temp2 = str2.substring(str2.length - str1.length, str2.length);
        if (temp1 == str1 && temp2 == str1) {
          return true;
        }
      }
      return false;
    }

    int ans = 0;
    for (var i = 0; i < words.length; i++) {
      for (var j = i + 1; j < words.length; j++) {
        isPrefixAndSuffix(words[i], words[j]) ? ans++ : ans;
      }
    }
    return ans;
  }
}
