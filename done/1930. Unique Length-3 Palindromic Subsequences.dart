class Solution {
  int countPalindromicSubsequence(String s) {
    Set<String> characters = s.split('').toSet();
    int ans = 0;
    for (var i = 0; i < characters.length; i++) {
      int firstIndex = s.indexOf(characters.elementAt(i));
      int lastIndex = s.lastIndexOf(characters.elementAt(i));
      if (firstIndex != lastIndex) {
        Set<String> temp =
            s.substring(firstIndex + 1, lastIndex).split('').toSet();
        ans += temp.length;
      }
    }

    return ans;
  }
}
