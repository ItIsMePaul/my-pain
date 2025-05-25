class ATM {
  static List<int> _banknotes = [20, 50, 100, 200, 500];
  List<int> banknotesAmount = List.filled(_banknotes.length, 0);
  ATM() {}

  void deposit(List<int> banknotesCount) {
    for (var i = 0; i < banknotesAmount.length; i++) {
      banknotesAmount[i] += banknotesCount[i];
    }
  }

  List<int> withdraw(int amount) {
    List<int> temp = List.filled(_banknotes.length, 0);
    for (var i = _banknotes.length - 1; i >= 0; i--) {
      int banknotesNeeded = amount ~/ _banknotes[i];
      int banknotesCount = banknotesNeeded > banknotesAmount[i]
          ? banknotesAmount[i]
          : banknotesNeeded;
      amount -= banknotesCount * _banknotes[i];
      temp[i] = banknotesCount;
      if (amount == 0) {
        for (var i = 0; i < temp.length; i++) {
          banknotesAmount[i] -= temp[i];
        }
        return temp;
      }
    }
    return [-1];
  }
}

/**
 * Your ATM object will be instantiated and called as such:
 * ATM obj = ATM();
 * obj.deposit(banknotesCount);
 * List<int> param2 = obj.withdraw(amount);
 */