class Solution {
  int matchPlayersAndTrainers(List<int> players, List<int> trainers) {
    players.sort();
    trainers.sort();
    int result = 0;
    int indexT = 0;
    int indexP = 0;
    while (indexP < players.length && indexT < trainers.length) {
      if (players[indexP] <= trainers[indexT]) {
        result++;
        indexP++;
        indexT++;
      } else {
        indexT++;
      }
    }
    return result;
  }
}
