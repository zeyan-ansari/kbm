import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../Helper/App_notifier.dart';
import '../Widgets/custom_app_bar.dart';
import '../Widgets/utility_card_widget.dart';

class TasweehScreen extends StatefulWidget {
  final String title;
  const TasweehScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<TasweehScreen> createState() => _TasweehScreenState();
}

class _TasweehScreenState extends State<TasweehScreen> {
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
        body: GestureDetector(
          onTap: () {
            HapticFeedback.mediumImpact();
            _incrementCounter();
          },
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularPercentIndicator(
                  animation: false,
                  radius: 80.0,
                  lineWidth: 30.0,
                  percent: _counter,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(_counter.toStringAsFixed(2)),
                  progressColor:
                      appState.isDarkMode ? Colors.black : Color(0xffa80000),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
