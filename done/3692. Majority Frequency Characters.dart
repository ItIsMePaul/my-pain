import 'dart:collection';

class Solution {
  String majorityFrequencyGroup(String s) {
    Map<String, int> frequency = {};
    for (var i = 0; i < s.length; i++)
      frequency[s[i]] = (frequency[s[i]] ?? 0) + 1;
    SplayTreeMap<int, List<String>> freqMap = SplayTreeMap((a, b) => b - a);
    for (var key in frequency.keys) {
      int freq = frequency[key]!;
      if (!freqMap.containsKey(freq)) {
        freqMap[freq] = [];
      }
      freqMap[freq]!.add(key);
    }
    int largerGroupSize = 0;
    String result = "";
    for (var key in freqMap.keys) {
      if (freqMap[key]!.length > largerGroupSize) {
        largerGroupSize = freqMap[key]!.length;
        result = freqMap[key]!.join();
      }
    }
    return result;
  }
}
