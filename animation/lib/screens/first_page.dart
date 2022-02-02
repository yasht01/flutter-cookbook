import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: const Center(
        child: Text('First Page'),
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          onPressed: () => Navigator.pushNamed(context, '/second'),
          icon: const Icon(Icons.splitscreen),
        ),
      ),
    );
  }
}
