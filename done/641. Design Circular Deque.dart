class MyCircularDeque {
  List<int> deque = [];
  late int size;
  MyCircularDeque(int k) {
    size = k;
  }

  bool insertFront(int value) {
    if (deque.length < size) {
      deque.insert(0, value);
      return true;
    } else {
      return false;
    }
  }

  bool insertLast(int value) {
    if (deque.length < size) {
      deque.add(value);
      return true;
    } else {
      return false;
    }
  }

  bool deleteFront() {
    if (deque.isNotEmpty) {
      deque.removeAt(0);
      return true;
    } else {
      return false;
    }
  }

  bool deleteLast() {
    if (deque.isNotEmpty) {
      deque.removeLast();
      return true;
    } else {
      return false;
    }
  }

  int getFront() {
    if (deque.isEmpty) {
      return -1;
    } else {
      return deque.first;
    }
  }

  int getRear() {
    if (deque.isEmpty) {
      return -1;
    } else {
      return deque.last;
    }
  }

  bool isEmpty() {
    return deque.isEmpty;
  }

  bool isFull() {
    return deque.length == size;
  }
}

/**
 * Your MyCircularDeque object will be instantiated and called as such:
 * MyCircularDeque obj = MyCircularDeque(k);
 * bool param1 = obj.insertFront(value);
 * bool param2 = obj.insertLast(value);
 * bool param3 = obj.deleteFront();
 * bool param4 = obj.deleteLast();
 * int param5 = obj.getFront();
 * int param6 = obj.getRear();
 * bool param7 = obj.isEmpty();
 * bool param8 = obj.isFull();
 */