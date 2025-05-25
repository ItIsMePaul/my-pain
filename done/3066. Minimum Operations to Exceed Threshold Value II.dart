/*import 'package:collection/collection.dart';

class Solution {
  int minOperations(List<int> nums, int k) {
    var heap = HeapPriorityQueue<int>((a, b) => a.compareTo(b));
    nums.forEach(heap.add);
    int ans = 0;
    while (heap.length > 1 && heap.first < k) {
      int num1 = heap.removeFirst();
      int num2 = heap.removeFirst();
      int combined = num1 * 2 + num2;
      heap.add(combined);
      ans++;
    }
    return ans;
  }
}*/

/*class SimplePriorityQueue<E> {
  final List<E> _elements = [];
  final Comparator<E> _comparator;

  SimplePriorityQueue(this._comparator);

  void add(E element) {
    int index = _binarySearchInsertIndex(element);
    _elements.insert(index, element);
  }

  E removeFirst() {
    return _elements.removeAt(0);
  }

  int get length => _elements.length;

  E get first => _elements.first;

  int _binarySearchInsertIndex(E elements) {
    int low = 0;
    int high = _elements.length;
    while (low < high) {
      int mid = low + (high - low) ~/ 2;
      if (_comparator(_elements[mid], elements) < 0) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }
    return low;
  }
}

class Solution {
  int minOperations(List<int> nums, int k) {
    int ans = 0;
    var heap = SimplePriorityQueue<int>((a, b) => a.compareTo(b));
    nums.forEach(heap.add);
    while (heap.length > 1 && heap.first < k) {
      int num1 = heap.removeFirst();
      int num2 = heap.removeFirst();
      int temp = num1 * 2 + num2;
      heap.add(temp);
      ans++;
    }
    return ans;
  }
}*/
