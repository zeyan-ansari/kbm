import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';



class AlQuranMenu extends StatefulWidget {
  final String title;
  const AlQuranMenu({Key? key, required this.title}) : super(key: key);

  @override
  State<AlQuranMenu> createState() => _AlQuranMenuState();
}

class _AlQuranMenuState extends State<AlQuranMenu> {
  double _counter = 0.0;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 0.01;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              Name: widget.title,
              isCompass: false,
              isDark: appState.isDarkMode,
            )),
        body:Container(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    leading: const Icon(Icons.list),
                    trailing: const Text(
                      "GFG",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text("List item $index"));
              }),
        ),
      );
    });
  }
}
