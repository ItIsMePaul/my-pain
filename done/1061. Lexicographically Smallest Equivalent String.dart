import 'dart:collection';

class Solution {
  String smallestEquivalentString(String s1, String s2, String baseStr) {
    List<SplayTreeSet<String>> storage = [];
    for (var i = 0; i < s1.length; i++) {
      SplayTreeSet<String> set = SplayTreeSet();
      set.addAll([s1[i], s2[i]]);
      storage.add(set);
    }
    bool fromZero = false;
    for (var i = 0; i < storage.length - 1; i++) {
      for (var j = i + 1; j < storage.length; j++) {
        if (storage[i].intersection(storage[j]).length > 0) {
          storage[i].addAll(storage.removeAt(j));
          j--;
          fromZero = true;
        }
      }
      if (fromZero) {
        i = -1;
        fromZero = !fromZero;
      }
    }
    Map<String, String> parser = {};
    for (var array in storage) {
      for (var value in array) {
        parser[value] = array.first;
      }
    }
    StringBuffer result = StringBuffer();
    for (var i = 0; i < baseStr.length; i++) {
      result.write(parser[baseStr[i]] ?? baseStr[i]);
    }
    return result.toString();
  }
}
