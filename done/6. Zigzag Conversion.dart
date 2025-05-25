class Solution {
  String convert(String s, int numRows) {
    List<StringBuffer> list = [];
    for (var i = 0; i < numRows; i++) {
      list.add(StringBuffer());
    }
    int currentRow = 0;
    bool direction = true;
    for (var i = 0; i < s.length; i++) {
      list[currentRow].write(s[i]);
      if (direction)
        currentRow++;
      else
        currentRow--;
      if (currentRow == numRows - 1) direction = false;
      if (currentRow == 0) direction = true;
    }
    for (var i = 1; i < list.length; i++) {
      list[0].write(list[i]);
    }
    return list.first.toString();
  }
}
