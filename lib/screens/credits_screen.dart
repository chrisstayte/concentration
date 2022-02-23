import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CreditsScreen extends StatefulWidget {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  _CreditsScreenState createState() => _CreditsScreenState();
}

class _CreditsScreenState extends State<CreditsScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Credits')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Developer'),
            trailing: Text('Chris Stayte'),
          ),
          ListTile(
            title: Text('Built With'),
            trailing: Text('Flutter'),
          ),
          ListTile(
            title: Text('Version'),
            trailing: Text('v${_packageInfo.version}'),
          ),
          ListTile(
            title: Text('Email Me'),
            trailing: Text('concentration@chrisstayte.com'),
          ),
          ListTile(
            title: Text('Repo'),
            trailing: Text('github.com/ChrisStayte/Concentration'),
          ),
          AboutListTile(
            child: const Text('View Licenses'),
            icon: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
