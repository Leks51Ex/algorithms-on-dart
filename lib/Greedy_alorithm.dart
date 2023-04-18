void main() {
  Set<String> statesNeeded = {'mt', 'wa', 'or', 'id', 'nv', 'ut', 'ca', 'az'};

  Map<String, Set<String>> stations = {
    'kone': {'id', 'nv', 'ut'},
    'ktwo': {'wa', 'id', 'mt'},
    'kthree': {'or', 'nv', 'ca'},
    'kfour': {'nv', 'ut'},
    'kfive': {'ca', 'az'},
  };

  Set<String> finalStation = {};

  while (statesNeeded.isNotEmpty) {
    String? bestStation;
    Set<String> statesCovered = {};

    for (var station in stations.keys) {
      Set<String> statesForStation = stations[station]!;
      Set<String> covered = statesNeeded.intersection(statesForStation);

      if (covered.length > statesCovered.length) {
        bestStation = station;
        statesCovered = covered;
      }
    }

    finalStation.add(bestStation!);
    statesNeeded = statesNeeded.difference(statesCovered);
  }

  print(finalStation);
}
