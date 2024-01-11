import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  int _r = 0;
  int _g = 0;
  int _b = 0;

  final BorderRadiusGeometry _borderRadus = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      body: Center(
        child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(borderRadius: _borderRadus, color: _color),
          ),
      ),
/*
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text('Ancho: $_width'),
          ),
          Container(
            child: Text('Alto: $_height'),
          ),
          Container(
            child: Text('Rojo: $_r' + ' Verde: $_g' + ' Azul: ${_b}'),
          ),
          Container(
            width: _width,
            height: _height,
            decoration:
                BoxDecoration(borderRadius: _borderRadus, color: _color),
          ),
        ],
      ),
*/

      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();
    setState(() {
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _r = random.nextInt(255);
      _g = random.nextInt(255);
      _b = random.nextInt(255);
      _color = Color.fromRGBO(
        _r, _g, _b, 1);
    });
  }
}
