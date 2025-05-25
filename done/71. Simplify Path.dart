import 'dart:collection';

class Solution {
  String? simplifyPath(String path) {
    Queue<String> stack = Queue<String>();
    List<String> dirs = path.split('/');
    for (var dir in dirs) {
      if (dir == '' || dir == '.') {
        continue;
      } else if (dir == '..') {
        if (stack.isNotEmpty) {
          stack.removeLast();
        }
      } else {
        stack.add(dir);
      }
    }
    StringBuffer formatedPath = StringBuffer('/');
    formatedPath.write(stack.join('/'));
    return formatedPath.toString();
  }
}
