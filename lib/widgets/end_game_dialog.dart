import 'package:concentration/global/global.dart';
import 'package:concentration/models/game_stat.dart';
import 'package:concentration/screens/game_screen.dart';
import 'package:flutter/material.dart';

class EndGameDialog extends StatelessWidget {
  const EndGameDialog({Key? key, required this.stat}) : super(key: key);

  final GameStat stat;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 375,
        child: Stack(
          children: [
            Container(
              width: 250,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Global.colors.lightIconColor,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 25,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 75,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.red,
                  ),
                  child: Icon(
                    Icons.cancel_rounded,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 150,
              child: GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/game',
                    ModalRoute.withName(
                        '/newGame') // Replace this with your root screen's route name (usually '/')
                    ),
                child: Container(
                  width: 75,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.yellow.shade800),
                  child: Icon(
                    Icons.replay_rounded,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
