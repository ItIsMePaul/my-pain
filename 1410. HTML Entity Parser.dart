class Solution {
  String entityParser(String text) {
    Map<String, String> htmlEntities = {
      '&quot;': '"',
      '&apos;': "'",
      '&amp;': '&',
      '&gt;': '>',
      '&lt;': '<',
      '&frasl;': '/',
    };
    StringBuffer result = StringBuffer();
    int i = 0;
    while (i < text.length) {
      if (text[i] == '&') {
        int j = text.substring(i).indexOf(';');
        int nextAmp = text.substring(i + 1).indexOf('&');
        if (nextAmp != -1 && nextAmp < j) j = nextAmp;
        if (j == -1) {
          result.write(text.substring(i));
          break;
        }
        result.write(
          htmlEntities[text.substring(i, i + j + 1)] ??
              text.substring(i, i + j + 1),
        );
        i = i + j + 1;
      } else {
        result.write(text[i]);
        i++;
      }
    }
    return result.toString();
  }
}
