class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? modifiedList(List<int> nums, ListNode? head) {
    ListNode? curr = head;
    ListNode? prev = null;
    Set<int> set = nums.toSet();
    while (curr != null) {
      if (set.contains(curr.val)) {
        if (prev == null) {
          head = head!.next;
          curr = curr.next;
          continue;
        }
        prev.next = curr.next;
        curr = curr.next;
        continue;
      }
      prev = curr;
      curr = curr.next;
    }
    return head;
  }
}
