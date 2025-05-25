class CustomStack {
  List<int> arr = [];
  final int maxSize;
  CustomStack(this.maxSize);

  void push(int x) {
    if (arr.length < maxSize) {
      arr.add(x);
    }
  }

  int pop() {
    return arr.isNotEmpty ? arr.removeLast() : -1;
  }

  void increment(int k, int val) {
    for (var i = 0; i < (k < arr.length ? k : arr.length); i++) arr[i] += val;
  }
}

/**
 * Your CustomStack object will be instantiated and called as such:
 * CustomStack obj = CustomStack(maxSize);
 * obj.push(x);
 * int param2 = obj.pop();
 * obj.increment(k,val);
 */