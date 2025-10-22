class Solution {
  String discountPrices(String sentence, int discount) {
    List<String> list = sentence.split(' ');
    StringBuffer result = StringBuffer();
    for (var word in list) {
      if (word[0] == "\$" && !word.contains('e')) {
        double? price = double.tryParse(word.substring(1));
        if (price != null) {
          result.write(
            '\$${(price - (price * (discount / 100))).toStringAsFixed(2)}',
          );
        } else {
          result.write(word);
        }
      } else {
        result.write(word);
      }
      result.write(' ');
    }
    return result.toString().trimRight();
  }
}
