class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeElements(ListNode? head, int val) {
    ListNode? prev;
    ListNode? curr = head;
    while (curr != null) {
      if (curr.val == val) {
        if (prev == null) {
          head = head!.next;
          curr = curr.next;
        } else {
          prev.next = curr.next;
          curr = curr.next;
        }
        continue;
      }
      prev = curr;
      curr = curr.next;
    }
    return head;
  }
}
