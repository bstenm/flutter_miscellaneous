import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  ContactList({
    Key key,
    @required this.entries,
  }) : super(key: key);

  final Map entries;

  @override
  Widget build(BuildContext context) {
    print(entries);
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: entries.keys.length,
        itemBuilder: (context, index) {
          String entry = entries.keys.toList()[index];

          return Column(
            children: <Widget>[
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  entry,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: entries[entry].length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (BuildContext ctx, int index) {
                  return ListTile(
                    title: Text(entries[entry][index]),
                    trailing: Icon(Icons.add),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
