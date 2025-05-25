import 'dart:collection';

class Solution {
  int evalRPN(List<String> tokens) {
    String _calculation(Function fun, String a, String b) =>
        fun(b, a).toString();
    int _add(String a, String b) => int.parse(a) + int.parse(b);
    int _substract(String a, String b) => int.parse(a) - int.parse(b);
    int _multiply(String a, String b) => int.parse(a) * int.parse(b);
    int _divide(String a, String b) => int.parse(a) ~/ int.parse(b);
    Queue<String> q = Queue();
    for (var token in tokens) {
      switch (token) {
        case '+':
          q.add(_calculation(_add, q.removeLast(), q.removeLast()));
          break;
        case '-':
          q.add(_calculation(_substract, q.removeLast(), q.removeLast()));
          break;
        case '*':
          q.add(_calculation(_multiply, q.removeLast(), q.removeLast()));
          break;
        case '/':
          q.add(_calculation(_divide, q.removeLast(), q.removeLast()));
          break;
        default:
          q.add(token);
      }
      print(q);
    }
    return int.parse(q.first);
  }
}
