import 'package:concentration/providers/game_stats_provider.dart';
import 'package:concentration/providers/settings_provider.dart';
import 'package:concentration/screens/credits_screen.dart';
import 'package:concentration/screens/game_screen.dart';
import 'package:concentration/screens/home_screen.dart';
import 'package:concentration/screens/new_game_screen.dart';
import 'package:concentration/screens/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'global/global.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsProvider>(
          create: (_) => SettingsProvider(),
        ),
        ChangeNotifierProvider<GameStatsProvider>(
          create: (_) => GameStatsProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Concentration',
        debugShowMaterialGrid: false,
        showSemanticsDebugger: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Global.colors.lightIconColor,

          appBarTheme: AppBarTheme(
            foregroundColor: Global.colors.darkIconColor,
            color: Global.colors.lightIconColor,
            elevation: 0,
            toolbarTextStyle: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            iconTheme: IconThemeData(
              //color: Color(0XFF536372),
              color: Global.colors.lightIconColorDarker,
            ),
            actionsIconTheme: IconThemeData(
              //color: Color(0XFF536372),
              color: Global.colors.lightIconColorDarker,
            ),
            titleTextStyle: TextStyle(
              color: Global.colors.darkIconColor,
              fontSize: 26,
            ),
          ),

          /// this was done to override the license page content, it's on a card
          cardColor: Global.colors.lightIconColor,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Global.colors.lightIconColorDarker,
            ),
          ),
          textTheme: TextTheme(
            subtitle1: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            subtitle2: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            headline1: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            headline2: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            headline3: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            headline4: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            headline5: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            headline6: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            bodyText1: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            bodyText2: TextStyle(
              color: Global.colors.darkIconColor,
            ),
            overline: TextStyle(
              color: Global.colors.darkIconColor,
            ),
          ),
          listTileTheme: Theme.of(context).listTileTheme.copyWith(
                iconColor: Global.colors.lightIconColorDarker,
              ),
        ),
        initialRoute: '/',
        // routes: {
        //   '/': (context) => const Homescreen(),
        //   '/newGame': (context) => NewGameScreen(),
        //   '/game': (context) => GameScreen(),
        //   '/stats': (context) => StatsScreen(),
        //   '/credits': (context) => CreditsScreen(),
        // },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return PageTransition(
                child: HomeScreen(),
                type: PageTransitionType.bottomToTop,
              );
              break;
            case '/newGame':
              return PageTransition(
                child: NewGameScreen(),
                type: PageTransitionType.rightToLeftWithFade,
              );
              break;
            case '/game':
              return PageTransition(
                child: GameScreen(),
                type: PageTransitionType.rightToLeft,
              );
              break;
            case '/stats':
              return PageTransition(
                child: StatsScreen(),
                childCurrent: this,
                type: PageTransitionType.rightToLeft,
              );
              break;
            case '/credits':
              return PageTransition(
                  child: CreditsScreen(),
                  type: PageTransitionType.rightToLeftWithFade);
              break;
            default:
              return null;
          }
        });
  }
}
