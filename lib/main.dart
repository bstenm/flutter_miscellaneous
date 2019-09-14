import 'package:flutter/material.dart';

import 'ContactSearch.dart';

const contacts = <String>[
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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactSearch(contacts: contacts),
    );
  }
}
