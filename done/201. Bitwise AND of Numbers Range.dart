class Solution {
  int rangeBitwiseAnd(int left, int right) {
    String binaryLeft = left.toRadixString(2);
    binaryLeft = '0' * (32 - binaryLeft.length) + binaryLeft;
    String binaryRight = right.toRadixString(2);
    binaryRight = '0' * (32 - binaryRight.length) + binaryRight;
    StringBuffer result = StringBuffer();
    int temp = 0;
    for (var i = 0; i < 32; i++) {
      if (binaryRight[i] == binaryLeft[i]) {
        result.write(binaryRight[i]);
        temp++;
      } else {
        break;
      }
    }
    result.write('0' * (32 - temp));
    return int.parse(result.toString(), radix: 2);
  }
}
