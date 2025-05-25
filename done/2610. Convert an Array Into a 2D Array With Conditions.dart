class Solution {
  List<List<int>> findMatrix(List<int> nums) {
    List<List<int>> list = [[]];
    main:
    for (var num in nums) {
      for (var i = 0; i < list.length; i++) {
        if (!list[i].contains(num)) {
          list[i].add(num);
          continue main;
        }
      }
      list.add([num]);
    }
    return list;
  }
}
