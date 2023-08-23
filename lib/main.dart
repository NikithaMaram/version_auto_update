import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cache and Service Worker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {

    print(_packageInfo.version);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Cache and Service Worker Demo'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Version: 2.0.0', // Change version number
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Welcome to the updated app! New version !!! ', // Change greeting message
              style: TextStyle(fontSize: 18,color: Colors.green),
            ),

          ],
        ),
      ),
    );
  }
}
