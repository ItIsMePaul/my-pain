class Solution {
  String frequencySort(String s) {
    List<int> numberList = [];
    List<String> letterList = [];
    for (var e in s.split('')) {
      if (letterList.contains(e)) {
        int i = letterList.indexWhere((element) => e == element);
        numberList[i]++;
      } else {
        letterList.add(e);
        numberList.add(1);
      }
    }
    List<int> sortedNumberList = List.of(numberList);
    sortedNumberList.sort((b, a) => a.compareTo(b));
    String rs = '';
    for (var e in sortedNumberList) {
      int i = numberList.indexWhere((n) => e == n);
      for (var j = 0; j < e; j++) {
        rs += letterList[i];
      }
      letterList.removeAt(i);
      numberList.removeAt(i);
    }
    return rs;
  }
}
