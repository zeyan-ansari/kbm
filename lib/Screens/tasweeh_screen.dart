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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter ++;
    });
  }
  void _decrementCounter() {
    setState(() {
      _counter --;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return Scaffold(
        bottomNavigationBar: Container(
          height: 100,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    _incrementCounter();
                  },
                  child: Container(padding: EdgeInsets.all(25),
                      margin: EdgeInsets.all(5),

                      decoration: ShapeDecoration(
                          color: appState.isDarkMode ? Colors.black : Color(0xffa80000),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(42)
                          )
                      ),
                      child: Text('+',textAlign: TextAlign.center,style: TextStyle(fontSize:32,color:Colors.white),)),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    _decrementCounter();
                  },
                  child: Container(padding: EdgeInsets.all(25),
                      margin: EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                          color: appState.isDarkMode ? Colors.black : Color(0xffa80000),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(42)
                          )
                      ),
                      child: Text('-',textAlign: TextAlign.center,style: TextStyle(fontSize:32,color:Colors.white),)),
                ),
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              Name: widget.title,
              isCompass: false,
              isDark: appState.isDarkMode,
            )),
        body: GestureDetector(
          onTap: () {
            HapticFeedback.heavyImpact();
            _incrementCounter();
          },
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(padding: EdgeInsets.all(50),
                    decoration: ShapeDecoration(
                      color: appState.isDarkMode ? Colors.black : Color(0xffa80000),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(42)
                      )
                    ),
                    child: Text(_counter.toString(),style: TextStyle(fontSize:32,color:Colors.white),)),

              ],
            ),
          ),
        ),
      );
    });
  }
}
