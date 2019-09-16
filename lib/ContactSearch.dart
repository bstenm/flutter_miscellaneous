import 'package:flutter/material.dart';
import 'package:flutter_cookbook/SearchBox.dart';
import 'package:provider/provider.dart';

import 'ContactList.dart';
import 'GroupedContacts.dart';
import 'ScrollControlButtons.dart';
import 'state/ContactListState.dart';

class ContactSearch extends StatefulWidget {
  ContactSearch({
    Key key,
  }) : super(key: key);

  @override
  _ContactSearchState createState() => _ContactSearchState();
}

class _ContactSearchState extends State<ContactSearch> {
  bool _searchOn;
  ScrollController _scrollController;
  TextEditingController _searchController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    _searchOn = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _contactList = Provider.of<ContactListState>(context);

    return Scaffold(
      appBar: AppBar(
        title: _searchOn
            ? SearchBox(
                controller: _searchController,
                filterContacts: _contactList.filterByTerm,
              )
            : Text('My Contacts'),
        actions: <Widget>[
          _searchOn
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _contactList.reset();
                    setState(() {
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
            _searchOn
                ? Container()
                : ScrollControlButtons(
                    entries: _contactList.entries,
                    scrollController: _scrollController,
                  ),
            ContactList(
              entries: _contactList.entries,
              onSelect: _contactList.select,
              selectDisabled: _searchOn,
              scrollController: _scrollController,
            ),
            _searchOn ? Container() : GroupedContacts(),
          ],
        ),
      ),
    );
  }
}
