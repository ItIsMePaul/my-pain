class ProductOfNumbers {
  List<int> _element = [];
  int _prefix = 1;
  ProductOfNumbers();

  void add(int num) {
    if (num == 0) {
      _element.clear();
      _prefix = 1;
    } else {
      _prefix *= num;
      _element.add(num);
    }
  }

  int getProduct(int k) {
    if (k >= _element.length) return 0;
    return _prefix ~/ _element[_element.length - 1 - k];
  }
}

/*
 * Your ProductOfNumbers object will be instantiated and called as such:
 * ProductOfNumbers obj = ProductOfNumbers();
 * obj.add(num);
 * int param2 = obj.getProduct(k);
 */

/*
class ProductOfNumbers {
  List<int> _product = [];
  ProductOfNumbers();

  void add(int num) {
    _product.add(num);
    for (var i = _product.length - 2; i >= 0; i--) {
      _product[i] *= _product.last;
    }
  }

  int getProduct(int k) {
    return _product[_product.length - k];
  }
}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * ProductOfNumbers obj = ProductOfNumbers();
 * obj.add(num);
 * int param2 = obj.getProduct(k);
 */

*/