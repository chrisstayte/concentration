import 'package:concentration/enums/gametheme.dart';
import 'package:concentration/global/global.dart';
import 'package:concentration/utilities/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

typedef GameThemeCallback = Function(GameTheme gameTheme);

class ThemeCard extends StatelessWidget {
  const ThemeCard(
      {Key? key,
      required this.selected,
      required this.gameTheme,
      required this.gameThemeCallback})
      : super(key: key);

  final bool selected;
  final GameTheme gameTheme;
  final GameThemeCallback gameThemeCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 113,
          height: 167,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            color: selected
                ? Global.colors.darkIconColor
                : Global.colors.lightIconColor,
          ),
          child: Center(
            child: GestureDetector(
              onTap: () {
                gameThemeCallback(gameTheme);
                HapticFeedback.mediumImpact();
              },
              child: Container(
                width: 105,
                height: 159,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    gradient: Global.gameThemeGradients.gradients[gameTheme]),
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: SvgPicture.asset(
                      'assets/images/${gameTheme.name}.svg',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: selected,
          child: Text(
            gameTheme.name.capitalize(),
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
