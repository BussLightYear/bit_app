import 'package:flutter/material.dart';
import './view/login_page.dart';
import './view/news_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: './news',
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case './login':
            return MaterialPageRoute(builder: (context) => new LoginPage());

          case './news':
            return MaterialPageRoute(builder: (context) => new NewsPage());

          default:
            return null;
        }
      },
    );
  }
}
