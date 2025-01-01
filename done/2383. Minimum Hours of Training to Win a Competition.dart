class Solution {
  int minNumberOfHours(int initialEnergy, int initialExperience,
      List<int> energy, List<int> experience) {
    int ans = 0;
    for (var i = 0; i < energy.length; i++) {
      if (initialEnergy > energy[i]) {
        initialEnergy -= energy[i];
      } else {
        ans += energy[i] - initialEnergy + 1;
        initialEnergy = 1;
      }
      if (initialExperience > experience[i]) {
        initialExperience += experience[i];
      } else {
        ans += experience[i] - initialExperience + 1;
        initialExperience +=
            experience[i] - initialExperience + 1 + experience[i];
      }
    }
    return ans;
  }
}
