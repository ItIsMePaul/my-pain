class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? swapPairs(ListNode? head) {
    if (head == null) return head;
    int v1 = head.val;
    head = head.next;
    if (head == null) return ListNode(v1);
    int v2 = head.val;
    head = head.next;
    ListNode? result = ListNode(v2);
    ListNode? current = result;
    current.next = ListNode(v1);
    current = current.next;
    while (head != null) {
      int v1 = head.val;
      head = head.next;
      if (head == null) {
        current!.next = ListNode(v1);
        current = current.next;
        return result;
      }
      int v2 = head.val;
      head = head.next;
      current!.next = ListNode(v2);
      current = current.next;
      current!.next = ListNode(v1);
      current = current.next;
    }
    return result;
  }
}
