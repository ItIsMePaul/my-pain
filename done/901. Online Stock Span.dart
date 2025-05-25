class StockSpanner {
  List<int> prices = [];
  StockSpanner();

  int next(int price) {
    prices.add(price);
    int ans = 0;
    for (var i = prices.length - 1; i >= 0; i--) {
      if (prices.last <= prices[i])
        ans++;
      else
        break;
    }
    return ans;
  }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * StockSpanner obj = StockSpanner();
 * int param1 = obj.next(price);
 */