import 'package:concentration/enums/difficulty.dart';
import 'package:concentration/enums/gametheme.dart';
import 'package:concentration/enums/mapsize.dart';
import 'package:concentration/global/global.dart';
import 'package:concentration/providers/settings_provider.dart';
import 'package:concentration/screens/home_screen.dart';
import 'package:concentration/widgets/game_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Widget> getCards() {
    return <Widget>[Text('test')];
  }

  late var _rows;
  late var _columns;

  List<bool> _showFrontSideList = [];
  bool _showFrontSide = true;

  @override
  void didChangeDependencies() {
    MapSize mapSize = context.read<SettingsProvider>().mapSize;
    _rows = mapSize == MapSize.fourxfour
        ? 4
        : mapSize == MapSize.fivexsix
            ? 6
            : 8;
    _columns = mapSize == MapSize.fourxfour
        ? 4
        : mapSize == MapSize.fivexsix
            ? 5
            : 6;

    _showFrontSideList = List.filled(_rows * _columns, true);

    super.didChangeDependencies();
  }

  Widget _buildCard(Key key, String text, Color color) {
    final front = ValueKey(true) == key;
    return Expanded(
      child: Container(
        width: 54,
        key: key,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          gradient: front
              ? Global.gameThemeGradients
                  .gradients[context.read<SettingsProvider>().gameTheme]
              : null,
        ),
        child: Center(
          child: front
              ? SvgPicture.asset(
                  'assets/images/${context.read<SettingsProvider>().gameTheme.name}.svg')
              : Text(text),
        ),
      ),
    );
  }

  Widget _buildFront() => _buildCard(ValueKey(true), 'Front', Colors.red);

  Widget _buildBack() =>
      _buildCard(ValueKey(false), 'Back', Global.colors.darkIconColor);

  Widget _buildFlipAnimation(int index) {
    return GestureDetector(
      onTap: () => setState(
          () => _showFrontSideList[index] = !_showFrontSideList[index]),
      child: AnimatedSwitcher(
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        transitionBuilder: _transitionBuilder,
        duration: Duration(milliseconds: 400),
        child: _showFrontSideList[index] ? _buildFront() : _buildBack(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget _buildGrid() {
    int i = 0;

    List<Widget> rows = <Widget>[];

    for (int row = 0; row < _rows; row++) {
      List<Widget> items = <Widget>[];
      for (int column = 0; column < _columns; column++) {
        items.add(_buildFlipAnimation(i++));
      }

      rows.add(
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items,
          ),
        ),
      );
    }

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: rows,
      ),
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.red.shade100,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.red.shade200,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.red.shade300,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.blue,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.blue.shade100,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.blue.shade200,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.blue.shade300,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.green,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.green.shade100,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.green.shade200,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.green.shade300,
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.yellow,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.yellow.shade100,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.yellow.shade200,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.yellow.shade300,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Expanded(
              //   child: Container(
              //     color: Colors.blue,
              //     child: GridView.count(
              //       childAspectRatio: .5,
              //       shrinkWrap: true,
              //       crossAxisCount: _columns,
              //       mainAxisSpacing: 1,
              //       crossAxisSpacing: 1,
              //       children:
              //           List.generate(_rows * _columns, (index) => GameCard()),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        height: 55,
                        child: GestureDetector(
                          onTap: () => Navigator.popUntil(
                            context,
                            ModalRoute.withName('/'),
                          ),
                          child: Card(
                            elevation: 4,
                            margin: EdgeInsets.zero,
                            color: Color(0XFFF25C54),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Icon(
                              Icons.cancel_outlined,
                              size: 48,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 55,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0XFF323031),
                        ),
                        child: const Center(
                          child: Text(
                            '4:00',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        height: 55,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Color(0XFF323031),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Text(
                                'Flips',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
