class Solution {
  List<int> memLeak(int memory1, int memory2) {
    int time = 0;
    int destroyMemory = 1;
    while (memory1 - destroyMemory > 0 && memory2 - destroyMemory > 0) {
      if (memory1 >= memory2) {
        memory1 -= destroyMemory++;
      } else {
        memory2 -= destroyMemory++;
      }
      time++;
    }
    return [time, memory1 != 0 ? memory1 : 0, memory2 != 0 ? memory2 : 0];
  }
}
