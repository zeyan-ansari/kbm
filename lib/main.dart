import 'package:flutter/material.dart';
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
  const MyApp({super.key});

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

