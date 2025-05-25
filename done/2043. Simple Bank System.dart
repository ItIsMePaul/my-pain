class Bank {
  List<int> balance;
  Bank(this.balance);

  bool transfer(int account1, int account2, int money) {
    if (account1 > balance.length ||
        account2 > balance.length ||
        balance[account1 - 1] < money) return false;

    balance[account1 - 1] -= money;
    balance[account2 - 1] += money;
    return true;
  }

  bool deposit(int account, int money) {
    if (account > balance.length) return false;
    balance[account - 1] += money;
    return true;
  }

  bool withdraw(int account, int money) {
    if (account > balance.length || balance[account - 1] < money) return false;
    balance[account - 1] -= money;
    return true;
  }
}

/**
 * Your Bank object will be instantiated and called as such:
 * Bank obj = Bank(balance);
 * bool param1 = obj.transfer(account1,account2,money);
 * bool param2 = obj.deposit(account,money);
 * bool param3 = obj.withdraw(account,money);
 */