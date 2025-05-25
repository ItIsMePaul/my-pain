class Solution {
  bool backspaceCompare(String s, String t) {
    List<String> listS = [];
    List<String> listT = [];

    for (var char in s.split('')) {
      if (char == '#') {
        if (listS.isNotEmpty) listS.removeLast();
        continue;
      }
      listS.add(char);
    }
    for (var char in t.split('')) {
      if (char == '#') {
        if (listT.isNotEmpty) listT.removeLast();
        continue;
      }
      listS.add(char);
    }

    return listT.join('') == listS.join('');
  }
}
