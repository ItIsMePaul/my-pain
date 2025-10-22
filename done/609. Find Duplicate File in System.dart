class Solution {
  List<List<String>> findDuplicate(List<String> paths) {
    Map<String, List<String>> map = {};
    for (var path in paths) {
      bool first = true;
      late String root;
      for (var element in path.split(' ')) {
        if (first) {
          root = element;
          first = !first;
        } else {
          int index = element.indexOf('(');
          String content = element.substring(index);
          if (map.containsKey(content)) {
            map[content]!.add(root + '/' + element.substring(0, index));
          } else {
            map[content] = [root + '/' + element.substring(0, index)];
          }
        }
      }
    }
    return map.values.where((e) => e.length > 1).toList();
  }
}
