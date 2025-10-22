class Solution {
  List<int> deckRevealedIncreasing(List<int> deck) {
    deck.sort();
    List<int> result = List.filled(deck.length, -1);
    List<int> indexes = List.generate(deck.length, (int index) => index);
    bool change = true;
    while (indexes.isNotEmpty) {
      for (var i = 0; i < indexes.length; i++) {
        if (change) {
          result[indexes.removeAt(i)] = deck.removeAt(0);
          i--;
        }
        change = !change;
      }
    }
    return result;
  }
}
