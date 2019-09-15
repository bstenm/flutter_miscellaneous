import 'package:flutter/foundation.dart';
import '../utils/sortListAlphabetically.dart';

class ContactListState with ChangeNotifier {
  final _contacts = <String>[
    'Adi Shamir',
    'Alan Kay',
    'Andrew Yao',
    'Barbara Liskov',
    'Kristen Nygaard',
    'Leonard Adleman',
    'Leslie Lamport',
    'Ole-Johan Dahl',
    'Peter Naur',
    'Robert E. Kahn',
    'Ronald L. Rivest',
    'Vinton G. Cerf',
  ];
  Map _entries = {};
  List _selected = List<String>();
  Map _sortedContacts = {};

  ContactListState() {
    _sortedContacts = sortListAlphabetically(_contacts);
    _entries.addAll(_sortedContacts);
  }

  Map get entries => _entries;

  List<String> get selected => _selected;

  void clearSelected() {
    _selected.clear();
    notifyListeners();
  }

  void select(String name) {
    if (_selected.contains(name)) {
      return;
    }
    _selected.add(name);
    notifyListeners();
  }

  void reset() {
    _entries.clear();
    _entries.addAll(_sortedContacts);
    notifyListeners();
  }

  void filterByTerm(String searchTerm) {
    List<String> matches = List<String>();

    // if no search term get all entries
    if (searchTerm.isEmpty) {
      _entries.clear();
      _entries.addAll(_sortedContacts);
      notifyListeners();
      return;
    }

    _contacts.forEach((contact) {
      if (contact.toLowerCase().contains(searchTerm.toLowerCase())) {
        matches.add(contact);
      }
    });

    _entries.clear();
    _entries.addAll(sortListAlphabetically(matches));
    notifyListeners();
  }
}
