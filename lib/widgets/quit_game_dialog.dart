import 'package:concentration/global/global.dart';
import 'package:flutter/material.dart';

class QuitGameDialog extends StatelessWidget {
  const QuitGameDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 175,
        child: Stack(
          children: [
            Container(
              width: 250,
              height: 150,
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
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, '/', (_) => false),
                child: Container(
                  width: 75,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Global.colors.darkIconColor),
                  child: Center(
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 150,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 75,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Global.colors.darkIconColor),
                  child: Center(
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
