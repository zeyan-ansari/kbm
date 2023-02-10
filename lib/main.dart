import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kbm/global_const.dart';
import 'package:provider/provider.dart';

import 'Helper/App_notifier.dart';
import 'Home.dart';

void main() {
  runApp(
      ChangeNotifierProvider<AppStateNotifier>(
          create: (context) => AppStateNotifier(),
          child:MyApp(),
      )
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    const HomeScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return Container(
          decoration:  BoxDecoration(
            gradient:
            backgroundColor,
          ),
            child:Transform.scale(
              scale: 0.5,
              child: Image.asset(
                'images/icons/logo.png',height: 50,width: 50,scale: 0.5,
              ),
            ),
        );
      }
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const Home(),
      );
    });
  }
}

