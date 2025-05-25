class FrontMiddleBackQueue {
  List<int> queue = [];
  FrontMiddleBackQueue() {}

  void pushFront(int val) {
    queue.insert(0, val);
  }

  void pushMiddle(int val) {
    int pos = queue.isNotEmpty ? queue.length ~/ 2 : 0;
    queue.insert(pos, val);
  }

  void pushBack(int val) {
    queue.add(val);
  }

  int popFront() {
    return queue.isNotEmpty ? queue.removeAt(0) : -1;
  }

  int popMiddle() {
    int pos = queue.isNotEmpty ? queue.length ~/ 2 : 0;
    pos = queue.length % 2 == 0 ? pos - 1 : pos;
    return queue.isNotEmpty ? queue.removeAt(pos) : -1;
  }

  int popBack() {
    return queue.isNotEmpty ? queue.removeLast() : -1;
  }
}

void main() {
  List<String> queries = [
    "FrontMiddleBackQueue",
    "pushFront",
    "pushBack",
    "pushMiddle",
    "pushMiddle",
    "popFront",
    "popMiddle",
    "popMiddle",
    "popBack",
    "popFront",
  ];
  List<List<int>> data = [
    [],
    [1],
    [2],
    [3],
    [4],
    [],
    [],
    [],
    [],
    [],
  ];
  final obj = FrontMiddleBackQueue();
  for (var i = 1; i < queries.length; i++) {
    print(queries[i]);
    switch (queries[i]) {
      case "pushFront":
        obj.pushFront(data[i][0]);
        break;
      case "pushMiddle":
        obj.pushMiddle(data[i][0]);
        break;
      case "pushBack":
        obj.pushBack(data[i][0]);
        break;
      case "popFront":
        print(obj.popFront());
        break;
      case "popMiddle":
        print(obj.popMiddle());
        break;
      case "popBack":
        print(obj.popBack());
        break;
    }
    print(obj.queue);
  }
}
