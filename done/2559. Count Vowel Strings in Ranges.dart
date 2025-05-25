class Solution {
  List<int> vowelStrings(List<String> words, List<List<int>> queries) {
    String vomels = 'aeiou';
    List<int> ans = [];
    List<int> sum = [0];
    for (var word in words) {
      if (vomels.contains(word[0]) && vomels.contains(word[word.length - 1])) {
        sum.add(sum.last + 1);
      } else {
        sum.add(sum.last);
      }
    }
    for (var j = 0; j < queries.length; j++) {
      ans.add((sum[queries[j][1]] - sum[queries[j][0]]));
    }
    return ans;
  }
}
