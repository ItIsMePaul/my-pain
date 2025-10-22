class Solution {
  int reverseBits(int n) {
    String binaryNum = n.toRadixString(2);
    binaryNum = (('0' * (32 - binaryNum.length)) + binaryNum)
        .split('')
        .reversed
        .join();
    return int.parse(binaryNum, radix: 2);
  }
}
