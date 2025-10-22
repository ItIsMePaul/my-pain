class Solution {
  List<String> validateCoupons(
    List<String> code,
    List<String> businessLine,
    List<bool> isActive,
  ) {
    Map<String, List<String>> validCoupons = {
      "electronics": [],
      "grocery": [],
      "pharmacy": [],
      "restaurant": [],
    };
    for (var i = 0; i < code.length; i++) {
      if (RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(code[i]) &&
          validCoupons.containsKey(businessLine[i]) &&
          isActive[i]) {
        validCoupons[businessLine[i]]!.add(code[i]);
      }
    }
    List<String> result = [];
    for (var key in validCoupons.keys) {
      if (validCoupons[key]!.isNotEmpty) {
        validCoupons[key]!.sort();
        result.addAll(validCoupons[key]!);
      }
    }
    return result;
  }
}
