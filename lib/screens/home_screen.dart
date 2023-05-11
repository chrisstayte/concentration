import 'package:concentration/global/global.dart';
import 'package:concentration/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27.0),
        child: Container(
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Concentration',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Global.colors.darkIconColor),
                  ),
                  Text(
                    'a game of memory',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: Global.colors.darkIconColor),
                  ),
                  const SizedBox(
                    height: 127,
                  ),
                  MainButton(
                      title: 'New Game',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        Navigator.pushNamed(
                          context,
                          '/newGame',
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                      title: 'Stats',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        Navigator.pushNamed(
                          context,
                          '/stats',
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                      title: 'Credits',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        Navigator.pushNamed(
                          context,
                          '/credits',
                        );
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
