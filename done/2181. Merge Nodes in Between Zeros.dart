class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? mergeNodes(ListNode? head) {
    ListNode dummy = ListNode(0);
    ListNode current = dummy;
    head = head!.next;
    int sum = 0;
    while (head != null) {
      if (head.val == 0) {
        current.next = ListNode(sum);
        current = current.next!;
        sum = 0;
      } else {
        sum += head.val;
      }
      head = head.next;
    }
    return dummy.next;
  }
}
