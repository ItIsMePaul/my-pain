import 'dart:math';

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  List<int> arr = [];
  Solution(ListNode? head) {
    while (head != null) {
      arr.add(head.val);
      head = head.next;
    }
  }

  int getRandom() {
    return arr[Random().nextInt(arr.length)];
  }
}

/**
 * Your Solution object will be instantiated and called as such:
 * Solution obj = Solution(head);
 * int param1 = obj.getRandom();
 */
