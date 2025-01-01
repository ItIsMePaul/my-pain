class OrderedStream {
  final int n;
  late List<String> memory;
  int ptr = 0;
  OrderedStream(this.n) {
    memory = List.filled(n, ' ');
  }

  List<String> insert(int idKey, String value) {
    ptr = memory.indexWhere((e) => e == ' ');
    memory[idKey - 1] = value;
    if (memory[ptr] == ' ') {
      return [];
    }
    int temp = memory.sublist(ptr).indexWhere((e) => e == ' ');
    temp = temp == -1 ? memory.length : temp + ptr;
    return memory.sublist(ptr, temp);
  }
}

/**
 * Your OrderedStream object will be instantiated and called as such:
 * OrderedStream obj = OrderedStream(n);
 * List<String> param1 = obj.insert(idKey,value);
 */