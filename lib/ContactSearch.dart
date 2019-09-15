import 'package:flutter/material.dart';
import 'package:flutter_cookbook/SearchBox.dart';

import 'ContactList.dart';
import 'GroupedContacts.dart';
import 'utils/sortListAlphabetically.dart';

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
  TextEditingController _searchController = TextEditingController();

  Map _entries = {};
  bool _searchOn = false;
  Map _sortedContacts = {};

  @override
  void initState() {
    _sortedContacts = sortListAlphabetically(widget.contacts);
    _entries.addAll(_sortedContacts);
    super.initState();
  }

  void filterContacts(String searchTerm) {
    List<String> matches = List<String>();

    if (searchTerm.isEmpty) {
      setState(() {
        _entries.clear();
        _entries.addAll(_sortedContacts);
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
                controller: _searchController,
                filterContacts: filterContacts,
              )
            : Text('My Contacts'),
        actions: <Widget>[
          _searchOn
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _entries.clear();
                      _entries.addAll(_sortedContacts);
                      _searchOn = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _searchOn = true;
                    });
                  },
                ),
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
