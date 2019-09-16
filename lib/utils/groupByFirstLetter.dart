Map groupByFirstLetter(List<String> list) {
  Map sorted = new Map();

  list.forEach((value) {
    String startWith = value.substring(0, 1);
    sorted[startWith] = sorted[startWith] ?? [];
    sorted[startWith].add(value);
  });

  return sorted;
}
