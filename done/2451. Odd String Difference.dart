class Solution {
  String oddString(List<String> words) {
    String wordDiff(String word) {
      List<int> nums = word.codeUnits;
      List<int> diff = [];
      for (var i = 1; i < nums.length; i++) {
        int temp = nums[i] - nums[i - 1];
        diff.add(temp);
      }
      return diff.join('-');
    }

    Map<String, List<String>> map = {};
    for (var word in words) {
      String temp = wordDiff(word);
      if (map.containsKey(temp))
        map[temp]!.add(word);
      else
        map[temp] = [word];

      if (map.length >= 2 &&
          (map.values.first.length >= 2 || map.values.last.length >= 2)) {
        return map.values.first.length == 1
            ? map.values.first.first
            : map.values.last.first;
      }
    }
    return '';
  }
}
