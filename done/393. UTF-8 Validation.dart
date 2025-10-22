class Solution {
  bool validUtf8(List<int> data) {
    bool startsWith10s(List<int> nums) {
      if (nums.isEmpty) {
        return false;
      }
      for (var num in nums) {
        String temp = num.toRadixString(2);
        temp = '0' * (8 - temp.length) + temp;
        if (!temp.startsWith('10')) {
          return false;
        }
      }
      return true;
    }

    int index = 0;
    while (index < data.length) {
      String temp = data[index].toRadixString(2);
      temp = '0' * (8 - temp.length) + temp;
      if (temp.startsWith('0')) {
        index++;
      } else if (temp.startsWith('110')) {
        int size = index + 2 <= data.length ? index + 2 : data.length;
        if (startsWith10s(data.sublist(index + 1, size))) {
          index += 2;
          continue;
        } else {
          return false;
        }
      } else if (temp.startsWith('1110')) {
        int size = index + 3 <= data.length ? index + 3 : data.length;
        if (startsWith10s(data.sublist(index + 1, size))) {
          index += 3;
          continue;
        } else {
          return false;
        }
      } else if (temp.startsWith('11110')) {
        int size = index + 4 <= data.length ? index + 4 : data.length;
        if (startsWith10s(data.sublist(index + 1, size))) {
          index += 4;
          continue;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
    return true;
  }
}
