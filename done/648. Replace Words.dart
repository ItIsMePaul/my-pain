class Solution {
  String replaceWords(List<String> dictionary, String sentence) {
    List<String> splitSentence = sentence.split(' ');
    String result = '';
    for (var i = 0; i < splitSentence.length; i++) {
      String word = splitSentence[i];
      for (var e in dictionary) {
        if (word.length >= e.length) {
          if (word.substring(0, e.length) == e) {
            word = e;
          }
        }
      }
      if (i != splitSentence.length - 1) {
        result += (word + " ");
      } else {
        result += word;
      }
    }
    return result;
  }
}
