class Solution {
  bool halvesAreAlike(String s) {
    List<String> vomels = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'];
    int firstHalf = 0;
    int secondHalf = 0;
    for (var i = 0; i < s.length ~/ 2; i++) {
      if (vomels.contains(s[i])) firstHalf++;
      if (vomels.contains(s[i + s.length ~/ 2])) secondHalf++;
    }
    return firstHalf == secondHalf;
  }
}
