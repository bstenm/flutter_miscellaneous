import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final filterContacts;
  final TextEditingController controller;

  SearchBox({
    Key key,
    @required this.controller,
    @required this.filterContacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        hintText: 'Search...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white),
      ),
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
      onChanged: filterContacts,
    );
  }
}
