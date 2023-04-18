import 'dart:collection';

Map<String, List<String>> graph = {
  'you': ['alice', 'bob', 'claire'],
  'bob': ['anuj', 'peggy'],
  'alice': ['peggy'],
  'claire': ['thom', 'johnny'],
  'anuj': [],
  'peggy': [],
  'thom': [],
  'johnny': [],
};

bool personIsSeller(String name) {
  return name == 'peggy';
}

bool search(String name) {
  Queue<String>? searchQueue = Queue();
  searchQueue.addAll(graph[name]!);
  List<String> searched = [];
  while (searchQueue.isNotEmpty) {
    String person = searchQueue.removeFirst();
    if (!searched.contains(person)) {
      if (personIsSeller(person)) {
        print('$person is a mango seller');
        return true;
      } else {
        searchQueue.addAll(graph[person]!);
        searched.add(person);
      }
    }
  }
  return false;
}


void main() {

search('you');
   
 }