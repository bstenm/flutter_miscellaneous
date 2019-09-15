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

    return Visibility(
      visible: selectedContacts.selected.length > 0,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green[200]),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Wrap(
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
                      fontSize: 12.0,
                    ),
                  ),
                );
              }).toList(),
            ),
            Divider(
              color: Colors.black26,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(
                  label: Text(
                    'Clear',
                    style: TextStyle(color: Colors.black54),
                  ),
                  icon: Icon(
                    Icons.clear,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    selectedContacts.empty();
                  },
                ),
                FlatButton.icon(
                  label: Text(
                    'Message Group',
                    style: TextStyle(color: Colors.black54),
                  ),
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        actions: <Widget>[
                          FlatButton.icon(
                            icon: Icon(Icons.send),
                            label: Text('Send'),
                            onPressed: () {},
                          )
                        ],
                        content: TextField(
                          decoration: InputDecoration(
                            hintText: 'Message to group',
                          ),
                          maxLines: 4,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
