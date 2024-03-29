import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  ContactList({
    Key key,
    @required this.entries,
    @required this.onSelect,
    @required this.selectDisabled,
    @required this.scrollController,
  }) : super(key: key);

  final Map entries;
  final bool selectDisabled;
  final Function onSelect;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
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
                  String contact = entries[entry][index];

                  return ListTile(
                    onTap: () {},
                    title: Text(contact),
                    trailing: IconButton(
                      icon: Icon(Icons.add),
                      disabledColor: Colors.white,
                      onPressed: selectDisabled
                          ? null
                          : () {
                              onSelect(contact);
                            },
                    ),
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
