class Solution {
  List<List<String>> suggestedProducts(
    List<String> products,
    String searchWord,
  ) {
    List<List<String>> ans = [];
    products.sort();
    for (var i = 0; i < searchWord.length; i++) {
      String part = searchWord.substring(0, i + 1);
      List<String> temp = [];
      for (var product in products) {
        if (product.startsWith(part)) {
          temp.add(product);
        }
        if (temp.length == 3) break;
      }
      ans.add(temp);
    }
    return ans;
  }
}
