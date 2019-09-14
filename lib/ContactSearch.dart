import 'package:flutter/material.dart';

import 'ContactList.dart';

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
  TextEditingController editingController = TextEditingController();

  Map entries = {};
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
    entries.addAll(sortedContacts);
    super.initState();
  }

  void filterContacts(String searchTerm) {
    var matches = List<String>();
    if (searchTerm.isEmpty) {
      setState(() {
        entries.clear();
        entries.addAll(sortedContacts);
      });
      return;
    }

    widget.contacts.forEach((contact) {
      if (contact.contains(searchTerm)) {
        matches.add(contact);
      }
    });

    setState(() {
      entries.clear();
      entries.addAll(sortListAlphabetically(matches));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Search'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: filterContacts,
                controller: editingController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            ContactList(entries: entries),
            Container(
              height: 100.0,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green[200]),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Leonard',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
