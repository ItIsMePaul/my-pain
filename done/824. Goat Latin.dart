class Solution {
  String toGoatLatin(String sentence) {
    List<String> vowels = ['a', 'e', 'i', 'o', 'u'];
    List<String> words = sentence.split(' ');
    for (var i = 0; i < words.length; i++) {
      String temp = words[i];
      if (vowels.contains(temp[0].toLowerCase()))
        temp = temp + 'ma';
      else
        temp = temp.substring(1) + temp[0] + 'ma';
      temp = temp + ('a' * (i + 1));
      words[i] = temp;
    }
    return words.join(' ');
  }
}
