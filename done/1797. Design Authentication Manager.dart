class AuthenticationManager {
  final int liveTime;
  Map<String, int> memory = {};
  AuthenticationManager(this.liveTime);

  void generate(String tokenId, int currentTime) {
    memory[tokenId] = currentTime + liveTime;
  }

  void renew(String tokenId, int currentTime) {
    if (memory.containsKey(tokenId) && memory[tokenId]! > currentTime) {
      memory[tokenId] = currentTime + liveTime;
    }
  }

  int countUnexpiredTokens(int currentTime) {
    int unexpired = 0;
    for (var token in memory.keys) {
      if (memory[token]! > currentTime) {
        unexpired++;
      }
    }
    return unexpired;
  }
}
