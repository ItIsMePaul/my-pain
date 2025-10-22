import 'dart:collection';

class FoodRatings {
  Map<String, SplayTreeMap<int, SplayTreeSet<String>>> map = {};
  Map<String, String> cuisineMap = {};
  Map<String, int> ratingMap = {};
  FoodRatings(List<String> foods, List<String> cuisines, List<int> ratings) {
    for (var i = 0; i < foods.length; i++) {
      if (!map.containsKey(cuisines[i])) {
        map[cuisines[i]] = SplayTreeMap((a, b) => b.compareTo(a));
      }
      if (!map[cuisines[i]]!.containsKey(ratings[i])) {
        map[cuisines[i]]![ratings[i]] = SplayTreeSet();
      }
      map[cuisines[i]]![ratings[i]]!.add(foods[i]);
      cuisineMap[foods[i]] = cuisines[i];
      ratingMap[foods[i]] = ratings[i];
    }
  }

  void changeRating(String food, int newRating) {
    String cuisine = cuisineMap[food]!;
    int oldRating = ratingMap[food]!;
    map[cuisine]![oldRating]!.remove(food);
    if (map[cuisine]![oldRating]!.isEmpty) {
      map[cuisine]!.remove(oldRating);
    }
    if (!map[cuisine]!.containsKey(newRating)) {
      map[cuisine]![newRating] = SplayTreeSet();
    }
    map[cuisine]![newRating]!.add(food);
    ratingMap[food] = newRating;
  }

  String highestRated(String cuisine) {
    return map[cuisine]![map[cuisine]!.firstKey()]!.first;
  }
}
