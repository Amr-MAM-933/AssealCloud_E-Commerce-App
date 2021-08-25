import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const screenId = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    AppBar _appBar;
    return Scaffold(
      appBar: _appBar = AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),
    );
  }
}
