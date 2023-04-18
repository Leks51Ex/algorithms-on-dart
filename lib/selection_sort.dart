  int findSmallest(List<int> arr) {
  int smallest = arr[0];
  int smallestIndex = 0;
  for (int i = 1; i < arr.length; i++) {
    if (arr[i] < smallest) {
      smallest = arr[i];
      smallestIndex = i;
    }
  }
  return smallestIndex;
}

List<int> selectionSort(List<int> arr) {
  List<int> newArr = [];
  while (arr.isNotEmpty) {
    int smallestIndex = findSmallest(arr);
    newArr.add(arr[smallestIndex]);
    arr.removeAt(smallestIndex);
  }
  return newArr;
}

 void main() {
   print(selectionSort([13, 1, 9, 66, 21, 22]));
 }






