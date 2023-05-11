import 'package:concentration/global/global.dart';
import 'package:flutter/material.dart';

typedef MainButtonCallback = Function();

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.onTap, required this.title})
      : super(key: key);

  final MainButtonCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 77,
        child: Card(
          elevation: 4,
          margin: EdgeInsets.zero,
          color: Global.colors.darkIconColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
