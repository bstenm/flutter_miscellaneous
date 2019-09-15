Map sortListAlphabetically(List<String> list) {
  Map sortedList = {};

  list.forEach((value) {
    String startWith = value.substring(0, 1);
    sortedList[startWith] = sortedList[startWith] ?? [];
    sortedList[startWith].add(value);
  });

  return sortedList;
}
