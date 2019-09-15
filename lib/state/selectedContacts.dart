import 'package:flutter/foundation.dart';

class SelectedContacts with ChangeNotifier {
  List _selected = List<String>();

  List<String> get selected => _selected;

  void empty() {
    _selected.clear();
    notifyListeners();
  }

  void add(String name) {
    if (_selected.contains(name)) {
      return;
    }
    _selected.add(name);
    notifyListeners();
  }
}
