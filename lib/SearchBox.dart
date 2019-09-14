import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController editingController = TextEditingController();
  final filterContacts;

  SearchBox({this.filterContacts});

  @override
  Widget build(BuildContext context) {
    print('Building Search Box');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          filterContacts(value);
        },
        controller: editingController,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }
}
