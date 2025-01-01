class MyStack {
  List<int> stack = [];
  MyStack() {}

  void push(int x) {
    stack.insert(0, x);
  }

  int pop() {
    return stack.removeAt(0);
  }

  int top() {
    return stack.first;
  }

  bool empty() {
    return stack.isEmpty;
  }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * MyStack obj = MyStack();
 * obj.push(x);
 * int param2 = obj.pop();
 * int param3 = obj.top();
 * bool param4 = obj.empty();
 */