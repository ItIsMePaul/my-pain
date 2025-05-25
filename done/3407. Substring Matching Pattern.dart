class Solution {
  bool hasMatch(String s, String p) {
    List<String> splitP = p.split('*');
    int firstIndex = s.indexOf(splitP[0]);
    int secondIndex = s.lastIndexOf(splitP[1]);
    print(firstIndex + splitP[0].length);
    if ((firstIndex != -1 || splitP[0] == "") &&
        (secondIndex != -1 || splitP[1] == "") &&
        secondIndex + 1 > firstIndex + splitP[0].length) {
      return true;
    } else {
      return false;
    }
  }
}
