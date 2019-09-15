import 'package:flutter/material.dart';
import 'package:flutter_cookbook/SearchBox.dart';

import 'ContactList.dart';
import 'GroupedContacts.dart';

class ContactSearch extends StatefulWidget {
  final contacts;
  ContactSearch({
    Key key,
    @required this.contacts,
  }) : super(key: key);

  @override
  _ContactSearchState createState() => _ContactSearchState();
}

class _ContactSearchState extends State<ContactSearch> {
  TextEditingController searchController = TextEditingController();

  Map _entries = {};
  bool _searchOn = false;
  Map sortedContacts = {};

  Map sortListAlphabetically(List<String> list) {
    Map sortedList = {};

    list.forEach((value) {
      String startWith = value.substring(0, 1);
      sortedList[startWith] = sortedList[startWith] ?? [];
      sortedList[startWith].add(value);
    });

    return sortedList;
  }

  @override
  void initState() {
    sortedContacts = sortListAlphabetically(widget.contacts);
    _entries.addAll(sortedContacts);
    super.initState();
  }

  void filterContacts(String searchTerm) {
    List<String> matches = List<String>();

    if (searchTerm.isEmpty) {
      setState(() {
        _entries.clear();
        _entries.addAll(sortedContacts);
      });
      return;
    }

    widget.contacts.forEach((contact) {
      if (contact.toLowerCase().contains(searchTerm.toLowerCase())) {
        matches.add(contact);
      }
    });

    setState(() {
      _entries.clear();
      _entries.addAll(sortListAlphabetically(matches));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchOn
            ? SearchBox(
                controller: searchController,
                filterContacts: filterContacts,
              )
            : Text('My Contacts'),
        actions: <Widget>[
          Visibility(
            visible: _searchOn,
            child: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _entries.clear();
                  _entries.addAll(sortedContacts);
                  _searchOn = false;
                });
              },
            ),
          ),
          Visibility(
            visible: !_searchOn,
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _searchOn = true;
                });
              },
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ContactList(entries: _entries),
            GroupedContacts(),
          ],
        ),
      ),
    );
  }
}
