class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  bool isPalindrome(ListNode? head) {
    List<int> list = [];
    while (head != null) {
      list.add(head.val);
      head = head.next;
    }
    for (var i = 0; i <= list.length ~/ 2; i++) {
      if (list[i] != list[list.length - i - 1]) {
        return false;
      }
    }
    return true;
  }
}
