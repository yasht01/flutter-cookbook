import 'dart:math';

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _visible = true;
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.black;

  void _animateContainer() {
    setState(() {
      _width = Random().nextDouble() * 300.0;
      _height = Random().nextDouble() * 300.0;
      _color = Color.fromRGBO(
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextInt(255),
        Random().nextDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _visible == true ? 1 : 0,
            child: AnimatedContainer(
              width: _width,
              height: _height,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeIn,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                color: _color,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            child: IconButton(
              onPressed: () => _animateContainer(),
              icon: const Icon(Icons.play_arrow_rounded),
            ),
          ),
          CircleAvatar(
            child: IconButton(
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
              icon: const Icon(Icons.brightness_5_rounded),
            ),
          ),
          CircleAvatar(
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/second'),
              icon: const Icon(Icons.splitscreen),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
