class TextEditor {
  List<String> leftMemory = [];
  List<String> rightMemory = [];
  int cursorPosition = 0;
  int textLength = 0;

  void addText(String text) {
    leftMemory.add(text);
    cursorPosition += text.length;
    textLength += text.length;
  }

  int deleteText(int k) {
    int deletedCharacters = 0;
    while (k > 0 && leftMemory.isNotEmpty) {
      String lastText = leftMemory.removeLast();
      if (lastText.length <= k) {
        deletedCharacters += lastText.length;
        k -= lastText.length;
      } else {
        leftMemory.add(lastText.substring(0, lastText.length - k));
        deletedCharacters += k;
        k = 0;
      }
    }
    cursorPosition -= deletedCharacters;
    return deletedCharacters;
  }

  String cursorLeft(int k) {
    int moveCursor = k > textLength ? textLength : k;
    if (moveCursor > 0) {
      int remaining = moveCursor;
      while (remaining > 0 && leftMemory.isNotEmpty) {
        String lastText = leftMemory.removeLast();
        if (lastText.length <= remaining) {
          rightMemory.insert(0, lastText);
          cursorPosition -= lastText.length;
          remaining -= lastText.length;
        } else {
          leftMemory.add(lastText.substring(0, lastText.length - remaining));
          rightMemory.insert(
            0,
            lastText.substring(lastText.length - remaining),
          );
          cursorPosition -= remaining;
          remaining = 0;
        }
      }
    }
    return _getLastTenCharacters();
  }

  String cursorRight(int k) {
    int moveCursor = k > textLength ? textLength : k;
    if (moveCursor > 0) {
      int remaining = moveCursor;
      while (remaining > 0 && rightMemory.isNotEmpty) {
        String firstText = rightMemory.removeAt(0);
        if (firstText.length <= remaining) {
          leftMemory.add(firstText);
          cursorPosition += firstText.length;
          remaining -= firstText.length;
        } else {
          rightMemory.insert(0, firstText.substring(remaining));
          leftMemory.add(firstText.substring(0, remaining));
          cursorPosition += remaining;
          remaining = 0;
        }
      }
    }
    return _getLastTenCharacters();
  }

  String _getLastTenCharacters() {
    String result = '';
    for (var i = leftMemory.length - 1; i >= 0; i--) {
      String text = leftMemory[i];
      if (result.length + text.length <= 10) {
        result = text + result;
      } else {
        result = text.substring(text.length - (10 - result.length)) + result;
        break;
      }
    }
    return result.toString();
  }
}

class TextEditor1 {
  StringBuffer leftSide = StringBuffer();
  StringBuffer rightSide = StringBuffer();
  int cursorPosition = 0;
  TextEditor() {}

  void addText(String text) {
    leftSide.write(text);
    cursorPosition += text.length;
  }

  int deleteText(int k) {
    int deletedCharacters = k > leftSide.length ? leftSide.length : k;
    if (deletedCharacters > 0) {
      String remainingText = leftSide.toString().substring(
        0,
        leftSide.length - deletedCharacters,
      );
      leftSide.clear();
      leftSide.write(remainingText);
      cursorPosition -= deletedCharacters;
    }
    return deletedCharacters;
  }

  String cursorLeft(int k) {
    int moveCursor = k > leftSide.length ? leftSide.length : k;
    if (moveCursor > 0) {
      cursorPosition -= moveCursor;
      String textLeftSide = leftSide.toString();
      String textRightSide = rightSide.toString();
      leftSide.clear();
      rightSide.clear();
      leftSide.write(
        textLeftSide.substring(0, textLeftSide.length - moveCursor),
      );
      rightSide.write(
        textLeftSide.substring(textLeftSide.length - moveCursor) +
            textRightSide,
      );
    }
    return _getLastTenCharacters();
  }

  String cursorRight(int k) {
    int moveCursor = k > rightSide.length ? rightSide.length : k;
    if (moveCursor > 0) {
      cursorPosition += moveCursor;
      String textRightSide = rightSide.toString();
      rightSide.clear();
      leftSide.write(textRightSide.substring(0, moveCursor));
      rightSide.write(textRightSide.substring(moveCursor));
    }
    return _getLastTenCharacters();
  }

  String _getLastTenCharacters() {
    if (leftSide.length > 10) {
      return leftSide.toString().substring(leftSide.length - 10);
    } else {
      return leftSide.toString();
    }
  }
}
