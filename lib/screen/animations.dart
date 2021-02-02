import 'dart:math';

import 'package:flutter/material.dart';

class Anim extends StatefulWidget {
  @override
  _AnimState createState() => _AnimState();
}

class _AnimState extends State<Anim> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animaciones'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color,
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final _random = Random();

            _width = _random.nextInt(300).toDouble();

            _height = _random.nextInt(300).toDouble();

            _color = Color.fromRGBO(
              _random.nextInt(256),
              _random.nextInt(256),
              _random.nextInt(256),
              1,
            );

            _borderRadius =
                BorderRadius.circular(_random.nextInt(100).toDouble());
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
