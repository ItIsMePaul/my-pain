class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? middleNode(ListNode? head) {
    ListNode? slow = head;
    ListNode? fast = head;
    bool turnSlow = false;
    while (fast != null) {
      if (turnSlow) {
        slow = slow?.next;
        fast = fast.next;
        turnSlow = !turnSlow;
      } else {
        fast = fast.next;
        turnSlow = !turnSlow;
      }
    }
    return slow;
  }
}
