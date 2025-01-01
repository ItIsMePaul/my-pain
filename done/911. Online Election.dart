class TopVotedCandidate {
  final List<int> persons;
  final List<int> times;
  Map<int, int> _askedq = {};
  TopVotedCandidate(this.persons, this.times) {
    Map<int, int> temp = {};
    int winner = 0;
    int winnerVotes = 0;
    for (var i = 0; i < persons.length; i++) {
      if (temp.containsKey(persons[i])) {
        temp[persons[i]] = temp[persons[i]]! + 1;
      } else {
        temp[persons[i]] = 1;
      }
      if (temp[persons[i]]! >= winnerVotes) {
        winner = persons[i];
        winnerVotes = temp[persons[i]]!;
      }
      _askedq[i] = winner;
    }
  }

  int q(int t) {
    int index = times.indexWhere((time) => time > t);
    index = index == -1 ? times.length : index;
    return _askedq[index - 1]!;
  }
}

/**
 * Your TopVotedCandidate object will be instantiated and called as such:
 * TopVotedCandidate obj = TopVotedCandidate(persons, times);
 * int param1 = obj.q(t);
 */