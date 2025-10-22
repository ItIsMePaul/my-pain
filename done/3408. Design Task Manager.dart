import 'dart:collection';

class TaskManager {
  SplayTreeMap<int, SplayTreeMap<int, int>> memory = SplayTreeMap(
    (a, b) => b.compareTo(a),
  );
  Map<int, int> priority = {};

  TaskManager(List<List<int>> tasks) {
    for (var task in tasks) add(task[0], task[1], task[2]);
  }

  void add(int userId, int taskId, int priority) {
    this.priority[taskId] = priority;
    if (memory.containsKey(priority)) {
      memory[priority]![taskId] = userId;
    } else {
      memory[priority] = SplayTreeMap((a, b) => b.compareTo(a));
      memory[priority]![taskId] = userId;
    }
  }

  void edit(int taskId, int newPriority) {
    int userID = getUserID(this.priority[taskId]!, taskId);
    rmv(taskId);
    add(userID, taskId, newPriority);
  }

  void rmv(int taskId) {
    int? priorityKey = priority.remove(taskId);
    memory[priorityKey]!.remove(taskId);
    if (memory[priorityKey]!.isEmpty) memory.remove(priorityKey);
  }

  int execTop() {
    if (memory.isNotEmpty) {
      int Priority = memory.firstKey()!;
      int TaskID = memory[Priority]!.firstKey()!;
      int? UserID = memory[Priority]![TaskID];
      rmv(TaskID);
      if (UserID != null) {
        return UserID;
      }
    }
    return -1;
  }

  int getUserID(int priority, int taskID) {
    return memory[priority]![taskID]!;
  }
}
