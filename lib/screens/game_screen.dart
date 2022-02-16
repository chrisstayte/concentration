import 'package:concentration/screens/home_screen.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('Quit'),
        onPressed: () => Navigator.popUntil(
          context,
          ModalRoute.withName('/'),
        ),
      ),
    );
  }
}
