class Solution {
  int mostWordsFound(List<String> sentences) {
    int max = 0;
    for (var i = 0; i < sentences.length; i++) {
      int c = sentences[i].split(' ').length;
      if (max < c) {
        max = c;
      }
    }
    return max;
  }
}
