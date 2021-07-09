import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/routes.dart' as app_routes;
import 'package:flutter_demo/ui/home_page.dart';
import 'package:flutter_demo/ui/splash.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          app_routes.homeRoute: (BuildContext context) =>
              const HomePage(title: ""),
        },
        home: const Splash());
  }
}
