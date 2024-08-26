class Solution {
  List<String> sortPeople(List<String> names, List<int> heights) {
    Map<int, String> data = {};
    for (var i = 0; i < names.length; i++) {
      data[heights[i]] = names[i];
    }
    heights.sort();
    List<String> result = [];
    for (var i = heights.length - 1; i >= 0; i--) {
      result.add(data[heights[i]]!);
    }
    return result;
  }
}