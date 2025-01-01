class Solution {
  int countStudents(List<int> students, List<int> sandwiches) {
    int stop = 0;
    while (stop < students.length + 1 && students.isNotEmpty) {
      if (students[0] == sandwiches[0]) {
        students.removeAt(0);
        sandwiches.removeAt(0);
        stop = 0;
      } else {
        stop++;
        int temp = students.removeAt(0);
        students.add(temp);
      }
    }
    return students.length;
  }
}
