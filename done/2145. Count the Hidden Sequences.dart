class Solution {
  int numberOfArrays(List<int> differences, int lower, int upper) {
    List<int> array = [0];
    int minVal = array[0];
    int maxVal = array[0];
    for (int diff in differences) {
      int temp = array.last + diff;
      array.add(temp);
      if (temp < minVal) minVal = temp;
      if (temp > maxVal) maxVal = temp;
    }
    int result = (upper - lower) - (maxVal - minVal) + 1;
    return result < 0 ? 0 : result;
  }
}
