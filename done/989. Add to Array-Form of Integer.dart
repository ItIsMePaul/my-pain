class Solution {
  List<int> addToArrayForm(List<int> num, int k) {
    List<int> kToList = [];
    for (var num in k.toString().split('')) kToList.add(int.parse(num));
    int diff = kToList.length - num.length;
    if (diff > 0) {
      num.insertAll(0, List.filled(diff, 0));
    } else if (diff < 0) {
      kToList.insertAll(0, List.filled(diff.abs(), 0));
    }
    int one = 0;
    List<int> result = [];
    for (var i = num.length - 1; i >= 0; i--) {
      int sum = num[i] + kToList[i] + one;
      one = sum ~/ 10;
      result.insert(0, sum % 10);
    }
    if (one > 0) {
      result.insert(0, one);
    }
    return result;
  }
}
