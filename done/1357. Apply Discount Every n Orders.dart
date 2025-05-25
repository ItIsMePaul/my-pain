class Cashier {
  int currentCustomer = 0;
  final int n;
  final int discount;
  final Map<int, int> pricesMap = {};
  Cashier(this.n, this.discount, List<int> products, List<int> prices) {
    for (var i = 0; i < products.length; i++) {
      pricesMap[products[i]] = prices[i];
    }
  }

  double getBill(List<int> product, List<int> amount) {
    currentCustomer++;
    double bill = 0;
    for (var i = 0; i < product.length; i++) {
      bill += pricesMap[product[i]]! * amount[i];
    }
    if (currentCustomer != n) {
      return bill;
    } else {
      currentCustomer = 0;
      return bill * ((100 - discount) / 100);
    }
  }
}