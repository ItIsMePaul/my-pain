class Solution {
  int removeZeros(int n) {
    String str = n.toString();
    StringBuffer sb = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (str[i] != '0') {
        sb.write(str[i]);
      }
    }
    return sb.length == 0 ? 0 : int.parse(sb.toString());
  }
}
