class Solution {
  List<int> decode(List<int> encoded, int first) {
    List<int> decoded = [];
    decoded.add(first);
    int number = first ^ encoded[0];
    decoded.add(number);
    for (var i = 1; i < encoded.length; i++) {
      number = number ^ encoded[i];
      decoded.add(number);
    }
    return decoded;
  }
}
