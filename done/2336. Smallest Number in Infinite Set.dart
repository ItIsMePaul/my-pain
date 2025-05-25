class SmallestInfiniteSet {
  List<int> numbers = [];
  int smallestNumber = 1;
  SmallestInfiniteSet() {}

  int popSmallest() {
    if (numbers.isNotEmpty){
      return numbers.removeAt(0);
    } else {
      return smallestNumber++;
    }
  }

  void addBack(int num) {
    if (num < smallestNumber && !numbers.contains(num)) {
      numbers.add(num);
      numbers.sort();
    }
  }
}