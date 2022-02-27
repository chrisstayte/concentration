import 'package:concentration/enums/difficulty.dart';
import 'package:concentration/enums/gametheme.dart';
import 'package:concentration/enums/mapsize.dart';
import 'package:flutter/material.dart'
    show Alignment, Color, Gradient, HSLColor, LinearGradient;
import 'package:flutter/widgets.dart';

class Global {
  static final colors = _Colors();
  static final gameThemeGradients = _GameThemeGradients();
  static final gameTimesInSeconds = _GameTimesInSeconds();
}

class _GameTimesInSeconds {
  final Map<MapSize, Map<Difficulty, int>> times = {
    MapSize.fourxfour: {
      Difficulty.easy: 90,
      Difficulty.intermediate: 60,
      Difficulty.hard: 30,
    },
    MapSize.fivexsix: {
      Difficulty.easy: 240,
      Difficulty.intermediate: 180,
      Difficulty.hard: 60,
    },
    MapSize.sixxeight: {
      Difficulty.easy: 360,
      Difficulty.intermediate: 240,
      Difficulty.hard: 90
    }
  };
}

class _Colors {
  final lightIconColor = const Color(0XFFE7EAEB);
  late final lightIconColorDarker =
      HSLColor.fromColor(lightIconColor).withLightness(0.55).toColor();
  final darkIconColor = const Color(0XFF323031);
  late final darkIconColorLighter =
      HSLColor.fromColor(darkIconColor).withLightness(0.75).toColor();
}

class _GameThemeGradients {
  final Map<GameTheme, Gradient> gradients = {
    GameTheme.concentration: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0XFFFF9999),
        Color(0XFFBC1B6F),
      ],
    ),
    GameTheme.olive: const RadialGradient(
      radius: 1,
      colors: [
        Color(0XFFD12229),
        Color(0XFFF68A1E),
        Color(0XFFFDE01A),
        Color(0XFF007940),
        Color(0XFF732982),
        Color(0XFF24408E),
      ],
    ),
    GameTheme.retro: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0XFF16A9FF),
        Color(0XFFBEE8FE),
        Color(0XFF4CCF4D),
        Color(0XFF855203),
      ],
      stops: [
        0.55,
        0.8,
        0.85,
        1.0,
      ],
    )
  };
}
