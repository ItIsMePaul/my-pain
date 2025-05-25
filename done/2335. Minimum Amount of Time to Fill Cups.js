var fillCups = function(amount) {
  amount.sort(function(a, b) {return a - b});
  if (amount[0] + amount[1] <= amount[2]) {
    return amount[2];
  }
  if (amount[0] + amount[1] > amount[2]) {
    return amount[2] + Math.ceil((amount[1] + amount[0] - amount[2]) / 2);
  }
  return 0;
};