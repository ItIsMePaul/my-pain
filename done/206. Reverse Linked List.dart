/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? current = head;
    List<int> list = [];
    while (current != null) {
      list.add(current.val);
      current = current.next;
    }
    ListNode? ans = ListNode(list.last);
    current = ans;
    for (var i = list.length - 2; i >= 0; i--) {
      current!.next = ListNode(list[i]);
      current = current.next;
    }
    return ans;
  }
}
