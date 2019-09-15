import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ContactSearch.dart';
import 'state/ContactListState.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => ContactListState(),
      child: MaterialApp(
        title: 'Contact Listing',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: ContactSearch(),
      ),
    );
  }
}
