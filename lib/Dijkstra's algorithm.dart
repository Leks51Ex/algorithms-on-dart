void main() {
  Map<String, Map<String, num>> graph = {};
  graph['start'] = {'a': 6, 'b': 2};
  graph['a'] = {'fin': 1};
  graph['b'] = {'a': 3, 'fin': 5};
  graph['fin'] = {};

  Map<String, num> costs = {'a': 6, 'b': 2, 'fin': double.infinity};
  Map<String, String> parents = {'a': 'start', 'b': 'start', 'fin': ''};
  Set<String> processed = {};

  String findLowestCostNode(Map<String, num> costs) {
    num lowestCost = double.infinity;
    String lowestCostNode = '';
    for (String node in costs.keys) {
      num cost = costs[node]!;
      if (cost < lowestCost && !processed.contains(node)) {
        lowestCost = cost;
        lowestCostNode = node;
      }
    }
    return lowestCostNode;
  }

  String node = findLowestCostNode(costs);
  while (node.isNotEmpty) {
    num cost = costs[node]!;
    Map<String, num> neighbors = graph[node]!;
    for (String neighbor in neighbors.keys) {
      num newCost = cost + neighbors[neighbor]!;
      if (costs[neighbor]! > newCost) {
        costs[neighbor] = newCost;
        parents[neighbor] = node;
      }
    }
    processed.add(node);
    node = findLowestCostNode(costs);
  }

  print('Shortest path to fin: ${costs["fin"]!}');
  print('Path: ${getPath(parents, "fin")}');
}

List<String> getPath(Map<String, String> parents, String node) {
  List<String> path = [node];
  while (parents[node]!.isNotEmpty) {
    node = parents[node]!;
    path.insert(0, node);
  }
  return path;
}
