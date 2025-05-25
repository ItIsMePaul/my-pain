class FreqStack {
  List<int> stack = [];
  Map<int, int> freq = {};
  int maxFreq = 0;
  FreqStack() {}

  void push(int val) {
    stack.add(val);
    freq[val] = (freq[val] ?? 0) + 1;
    if (freq[val]! > maxFreq) {
      maxFreq = freq[val]!;
    }
  }

  int pop() {
    int res = 0;
    for (int i = stack.length - 1; i >= 0; i--) {
      if (freq[stack[i]] == maxFreq) {
        res = stack[i];
        freq[res] = freq[res]! - 1;
        stack.removeAt(i);
        break;
      }
    }
    if (freq[res] == 0) {
      freq.remove(res);
    }
    if (stack.isEmpty) {
      maxFreq = 0;
    } else {
      maxFreq = 0;
      for (int i in freq.values) {
        if (i > maxFreq) {
          maxFreq = i;
        }
      }
    }
    return res;
  }
}

/**
 * Your FreqStack object will be instantiated and called as such:
 * FreqStack obj = FreqStack();
 * obj.push(val);
 * int param2 = obj.pop();
 */
void main() {
  FreqStack obj = FreqStack();
  obj.push(5);
  obj.push(7);
  obj.push(5);
  obj.push(7);
  obj.push(4);
  obj.push(5);
  print(obj.pop()); // 5
  print(obj.pop()); // 7
  print(obj.pop()); // 5
  print(obj.pop()); // 4
}
