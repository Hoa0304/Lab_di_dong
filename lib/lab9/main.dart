import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';

void main() => runApp(ClimaApp());

class ClimaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      home: LoadingScreen(),
    );
  }
}
