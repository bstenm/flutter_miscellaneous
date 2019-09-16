import 'package:flutter/material.dart';

class ScrollControlButtons extends StatelessWidget {
  ScrollControlButtons({
    Key key,
    @required entries,
    @required scrollController,
  })  : _entries = entries,
        _scrollController = scrollController,
        super(key: key);

  final Map _entries;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    List keys = _entries.keys.toList()..sort();
    double position = 0.0;
    List<Map> withPos = List<Map>();

    keys.forEach((k) {
      Map e = Map();
      e['groupId'] = k;
      e['position'] = position;
      withPos.add(e);
      position += 35.0 + (_entries[k].length * 56.0);
    });

    List<Widget> _buildButtons() {
      return withPos.map((entry) {
        return Container(
          margin: EdgeInsets.all(5.0),
          width: 40.0,
          child: FlatButton(
            color: Colors.grey[300],
            child: Text(entry['groupId']),
            onPressed: () {
              _scrollController.animateTo(
                entry['position'],
                duration: new Duration(seconds: 1),
                curve: Curves.ease,
              );
            },
          ),
        );
      }).toList();
    }

    return Wrap(children: _buildButtons());
  }
}
