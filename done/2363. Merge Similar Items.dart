class Solution {
  List<List<int>> mergeSimilarItems(
    List<List<int>> items1,
    List<List<int>> items2,
  ) {
    List<List<int>> mergedItems = [];
    for (var i = 0; i < items1.length;) {
      for (var j = 0; j < items2.length; j++) {
        if (items1[i][0] == items2[j][0]) {
          mergedItems.add([items1[i][0], items1[i][1] + items2[j][1]]);
          items2.removeAt(j);
          items1.removeAt(i);
          i--;
          break;
        }
      }
      i++;
    }
    if (items1.isNotEmpty) {
      mergedItems.addAll(items1);
    }
    if (items2.isNotEmpty) {
      mergedItems.addAll(items2);
    }
    for (var i = 0; i < mergedItems.length - 1; i++) {
      if (mergedItems[i][0] > mergedItems[i + 1][0]) {
        List<List<int>> temp1 = [mergedItems[i]];
        List<List<int>> temp2 = [mergedItems[i + 1]];
        mergedItems.replaceRange(i, i + 1, temp2);
        mergedItems.replaceRange(i + 1, i + 2, temp1);
        i = -1;
      }
    }
    return mergedItems;
  }
}
