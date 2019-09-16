import 'package:flutter/material.dart';

class ScrollControlButtons extends StatelessWidget {
  final Map _entries;
  final List<Map> groupByPosition = List<Map>();
  final ScrollController _scrollController;

  ScrollControlButtons({
    Key key,
    @required entries,
    @required scrollController,
  })  : _entries = entries,
        _scrollController = scrollController,
        super(key: key) {
    List keys = _entries.keys.toList()..sort();
    double position = 0.0;

    // build new data structure with physical position as key
    keys.forEach((k) {
      Map e = Map();
      e['groupId'] = k;
      e['position'] = position;
      groupByPosition.add(e);
      position += 35.0 + (_entries[k].length * 56.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: groupByPosition.map((entry) {
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
      }).toList(),
    );
  }
}
