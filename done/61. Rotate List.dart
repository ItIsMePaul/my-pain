class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? rotateRight(ListNode? head, int k) {
    int size = 0;
    ListNode? temp = head;
    while (temp != null) {
      size++;
      temp = temp.next;
    }
    if (size <= 1 || k % size == 0) return head;
    k = k % size;
    for (var i = 0; i < k; i++) {
      ListNode? curr = head;
      ListNode? prev = null;
      while (curr!.next != null) {
        prev = curr;
        curr = curr.next;
      }
      curr.next = head;
      prev!.next = null;
      head = curr;
      continue;
    }
    return head;
  }
}
