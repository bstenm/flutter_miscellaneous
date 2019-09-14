import 'package:flutter/material.dart';
import 'package:flutter_cookbook/DraggableCard.dart';

class PhysicsCardDrag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physics card drag'),
      ),
      body: DraggableCard(
          child: FlutterLogo(
        size: 128,
      )),
    );
  }
}
