import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'concentration',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('New Game'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Stats'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Made With <3 With Flutter',
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                Switch(value: true, onChanged: (value) {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
