import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state/selectedContacts.dart';

class GroupedContacts extends StatelessWidget {
  const GroupedContacts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedContacts = Provider.of<SelectedContacts>(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green[200]),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Wrap(
        children: selectedContacts.selected.map((contact) {
          return Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              contact,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
