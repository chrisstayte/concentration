import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
      appBar: AppBar(title: const Text('Credits')),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Developer'),
            trailing: Text('Chris Stayte'),
          ),
          const ListTile(
            title: Text('Built With'),
            trailing: Text('Flutter'),
          ),
          ListTile(
            title: const Text('Version'),
            trailing: Text('v${_packageInfo.version}'),
          ),
          ListTile(
            title: const Text('Email Me'),
            trailing: const Text('concentration@chrisstayte.com'),
            onTap: () async {
              final Uri params = Uri(
                scheme: 'mailto',
                path: 'concentration@chrisstayte.com',
                query:
                    'subject=App Feedback (${_packageInfo.version})', //add subject and body here
              );

              final String url = params.toString();
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          ),
          ListTile(
            title: const Text('Repo'),
            trailing: const Text('github.com/ChrisStayte/Concentration'),
            onTap: () async {
              final Uri params = Uri(
                  scheme: 'https',
                  path: 'www.github.com/ChrisStayte/Concentration');

              final String url = params.toString();
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          ),
          ListTile(
            title: const Text('View Licenses'),
            trailing: const Icon(Icons.description),
            onTap: () => showLicensePage(context: context),
          ),
        ],
      ),
    );
  }
}
