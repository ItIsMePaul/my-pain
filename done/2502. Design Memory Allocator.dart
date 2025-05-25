class Allocator {
  List<int> memory = [];
  Map<int, List<int>> mIDLocation = {};
  int memoryLeft = -1;
  Allocator(int n) {
    memory = List.filled(n, -1);
    memoryLeft = n;
  }

  int allocate(int size, int mID) {
    for (var i = 0; i <= memory.length - size; i++) {
      if (memoryLeft < size) {
        return -1;
      }
      List<int> temp = memory.sublist(i, i + size);
      if (_isFree(temp)) {
        memory.fillRange(i, i + size, mID);
        mIDLocation[mID] = [
          ...(mIDLocation[mID] ?? []),
          ...List.generate(size, (int index) => i + index),
        ];
        memoryLeft -= size;
        return i;
      }
    }
    return -1;
  }

  int freeMemory(int mID) {
    int result = 0;
    for (var position in (mIDLocation[mID] ?? [])) {
      memory[position] = -1;
      result++;
    }
    mIDLocation.remove(mID);
    memoryLeft += result;
    return result;
  }

  bool _isFree(List<int> subMemory) {
    for (var memoryCell in subMemory) {
      if (memoryCell != -1) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Your Allocator object will be instantiated and called as such:
 * Allocator obj = Allocator(n);
 * int param1 = obj.allocate(size,mID);
 * int param2 = obj.freeMemory(mID);
 */
