class Solution {
  String maskPII(String s) {
    s = s.toLowerCase();
    if (s.contains('@')) {
      List<String> l = s.split('@');
      String name = l[0][0] + '*****' + l[0][l[0].length - 1];
      return name + '@' + l[1];
    } else {
      List<String> l = s.replaceAll(RegExp(r'(\D)'), '').split('');
      String end = '***-***-${l.sublist(l.length - 4, l.length).join()}';
      if (l.length > 10) {
        return '+' + '*' * (l.length - 10) + '-' + end;
      } else {
        return end;
      }
    }
  }
}
