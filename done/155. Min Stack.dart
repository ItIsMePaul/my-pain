class MinStack {
  List<int> stak = [];
  List<int> min = [];
  MinStack();

  void push(int val) {
    stak.add(val);
    if (min.isEmpty || min.last > val) {
      min.add(val);
    } else {
      min.add(min.last);
    }
  }

  void pop() {
    stak.removeLast();
    min.removeLast();
  }

  int top() {
    return stak.last;
  }

  int getMin() {
    return min.last;
  }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * MinStack obj = MinStack();
 * obj.push(val);
 * obj.pop();
 * int param3 = obj.top();
 * int param4 = obj.getMin();
 */