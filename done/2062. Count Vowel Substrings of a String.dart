class Solution {
  bool isLongPressedName(String name, String typed) {
    int pointer = 0;
    String lastCharacter = name[0];
    for (var i = 0; i < typed.length; i++) {
      if (pointer < name.length) {
        if (lastCharacter != typed[i] && name[pointer] != typed[i]) {
          return false;
        }
        if (name[pointer] == typed[i]) {
          lastCharacter = typed[i];
          pointer++;
        }
      } else {
        if (lastCharacter != typed[i]) {
          return false;
        }
      }
    }
    return pointer == name.length;
  }
}
