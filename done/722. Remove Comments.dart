class Solution {
  List<String> removeComments(List<String> source) {
    bool multiline = false;
    int? startOFMultiline;
    for (var i = 0; i < source.length; i++) {
      if (multiline) {
        if (source[i].contains('*/')) {
          int index = source[i].indexOf('*/');
          source[i] = source[i].substring(index + 2);
          String temp = source.removeAt(i);
          source[startOFMultiline!] = source[startOFMultiline] + temp;
          i = startOFMultiline - 1;
          startOFMultiline = null;
          multiline = false;
          continue;
        } else {
          source.removeAt(i);
          i--;
          continue;
        }
      }
      int sigleLine = source[i].indexOf('//');
      int multiLineindex = source[i].indexOf('/*');
      if (multiLineindex != -1 || sigleLine != -1) {
        if ((multiLineindex == -1 && sigleLine != -1) ||
            (sigleLine != -1 && sigleLine < multiLineindex)) {
          source[i] = source[i].substring(0, sigleLine);
          if (source[i].isEmpty) {
            source.removeAt(i);
          }
          i--;
        } else if ((multiLineindex != -1 && sigleLine == -1) ||
            (multiLineindex != -1 && multiLineindex < sigleLine)) {
          if (source[i].substring(multiLineindex + 2).contains('*/')) {
            int eIndex = source[i].lastIndexOf('*/');

            source[i] = source[i].replaceRange(multiLineindex, eIndex + 2, '');
            if (source[i].isEmpty) {
              source.removeAt(i);
            }
            i--;
            continue;
          } else {
            multiline = true;
            startOFMultiline = i;
            source[i] = source[i].substring(0, multiLineindex);
          }
        }
      }
    }
    return source;
  }
}

void main() {
  var temp = Solution().removeComments([
    "a\/*\/b\/\/*c",
    "blank",
    "d\/*\/e*\/\/f",
  ]);
  for (var e in temp) {
    print(e);
  }
}
