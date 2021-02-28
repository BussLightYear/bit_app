import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './view/login_page.dart';
import './view/news_page.dart';
import 'package:bit_app/view/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: './login',
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case './login':
            return MaterialPageRoute(builder: (context) => new LoginPage());

          case './news':
            return MaterialPageRoute(builder: (context) => new NewsPage());

          case './registration':
            return MaterialPageRoute(builder: (context) => new RegisterUser());

          default:
            return null;
        }
      },
    );
  }
}
