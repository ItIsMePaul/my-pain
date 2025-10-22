class Solution {
  int numWaterBottles(int numBottles, int numExchange) {
    int emptyBottles = 0;
    int result = 0;
    result += numBottles;
    do {
      emptyBottles += numBottles;
      numBottles = emptyBottles ~/ numExchange;
      emptyBottles -= numBottles * numExchange;
      result += numBottles;
    } while (numBottles + emptyBottles >= numExchange);
    return result;
  }
}
