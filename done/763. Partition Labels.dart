import 'dart:math';

class Solution {
  List<int> partitionLabels(String s) {
    Map<String, List<int>> letterPositions = {};
    for (var letter in s.split('').toSet()) {
      letterPositions[letter] = [];
      letterPositions[letter]!.add(s.indexOf(letter));
      letterPositions[letter]!.add(s.lastIndexOf(letter));
    }
    List<List<int>> intervals = letterPositions.values.toList();
    List<List<int>> mergedOverlaps = [];
    for (var i = 1; i < intervals.length; i++) {
      List<int> last = mergedOverlaps.last;
      List<int> current = intervals[i];
      if (last[1] >= current[0]) {
        last[0] = min(last[0], current[0]);
        last[1] = max(last[1], current[1]);
      } else {
        mergedOverlaps.add(current);
      }
    }
    List<int> result = [];
    for (var interval in mergedOverlaps) {
      result.add(interval.last - interval.first + 1);
    }
    return result;
  }
}
