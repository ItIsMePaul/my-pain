import '../ListNode.dart';

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    int temp = l1!.val + l2!.val;
    l1 = l1.next;
    l2 = l2.next;
    ListNode ans = ListNode(temp % 10);
    ListNode? current = ans;
    bool addOne = temp > 9;
    while (l1 != null || l2 != null) {
      temp = 0;
      if (l1 != null && l2 != null) {
        temp = addOne ? 1 : 0;
        temp += l1.val + l2.val;
        addOne = temp > 9;
        temp = temp % 10;
        current?.next = ListNode(temp);
        l1 = l1.next;
        l2 = l2.next;
      } else {
        if (l1 != null) {
          temp = addOne ? 1 : 0;
          temp += l1.val;
          l1 = l1.next;
          addOne = temp > 9;
          temp = temp % 10;
          current?.next = ListNode(temp);
        }
        if (l2 != null) {
          temp = addOne ? 1 : 0;
          temp += l2.val;
          l2 = l2.next;
          addOne = temp > 9;
          temp = temp % 10;
          current?.next = ListNode(temp);
        }
      }
      current = current?.next;
    }
    if (addOne) {
      current?.next = ListNode(1);
      current = current?.next;
    }
    return ans;
  }
}
