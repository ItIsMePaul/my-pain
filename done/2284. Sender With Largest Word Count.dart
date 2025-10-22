import 'dart:collection';

class Solution {
  String largestWordCount(List<String> messages, List<String> senders) {
    Map<String, int> map = {};
    for (var i = 0; i < messages.length; i++) {
      map[senders[i]] = (map[senders[i]] ?? 0) + messages[i].split(' ').length;
    }
    SplayTreeMap<int, SplayTreeSet<String>> sorted = SplayTreeMap(
      (a, b) => b.compareTo(a),
    );
    for (var sender in map.keys) {
      if (!sorted.containsKey(map[sender])) {
        sorted[map[sender]!] = SplayTreeSet((a, b) => b.compareTo(a));
      }
      sorted[map[sender]!]!.add(sender);
    }
    return sorted[sorted.firstKey()]!.first;
  }
}
