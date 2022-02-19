import 'package:concentration/enums/difficulty.dart';

class GameStat {
  bool win;
  Difficulty difficulty;
  DateTime gameStarted;
  Duration gameDuration;
  int flips;

  GameStat(
      {required this.win,
      required this.difficulty,
      required this.gameStarted,
      required this.gameDuration,
      required this.flips});

  factory GameStat.fromJson(Map<String, dynamic> json) {
    bool win = json['win'] as bool;
    Difficulty difficulty = _getDifficultyFromString(json['difficulty']);
    DateTime gameStarted = DateTime.parse(json['gameStarted']);
    Duration gameDuration = Duration(milliseconds: json['gameDuration']);
    int flips = json['flips'] as int;

    return GameStat(
        win: win,
        difficulty: difficulty,
        gameStarted: gameStarted,
        gameDuration: gameDuration,
        flips: flips);
  }

  Map<String, dynamic> toJson() => {
        'win': win,
        'difficulty': difficulty,
        'gameStarted': gameStarted.toString(),
        'gameDuration': gameDuration.inMilliseconds,
        'flips': flips
      };

  static Difficulty _getDifficultyFromString(String sortingMethodAsString) {
    for (Difficulty element in Difficulty.values) {
      if (element.toString() == sortingMethodAsString) {
        return element;
      }
    }
    return Difficulty.intermediate;
  }
}
