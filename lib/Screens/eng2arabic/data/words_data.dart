import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../../Helper/App_notifier.dart';
import '../../eng2Persian/widget/traslation_box.dart';
import '../search_delegate.dart';

class WordsPage extends StatelessWidget {
  final List<Map<String, dynamic>> arabic;
  final int i;
  WordsPage(this.arabic, this.i);
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
          appBar:
          AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
              backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
              elevation: 1,
              title: Text(arabic[i]['name']),
              actions: <Widget>[
                FlutterSwitch(
                  width: 45.0,
                  height: 25.0,
                  toggleSize: 20.0,
                  value: Provider.of<AppStateNotifier>(context).isDarkMode,
                  borderRadius: 45.0,
                  padding: 1.0,
                  activeToggleColor: Color(0xFF6E40C9),
                  inactiveToggleColor: Color(0xFF2F363D),
                  activeSwitchBorder: Border.all(
                    color: Colors.black38,
                    width: 1.0,
                  ),
                  inactiveSwitchBorder: Border.all(
                    color: Color(0xFFD1D5DA),
                    width: 1.0,
                  ),
                  activeColor: Colors.white24,
                  inactiveColor: Colors.white,
                  activeIcon: Icon(
                    Icons.nightlight_round,
                    color: Color(0xFFF8E3A1),
                  ),
                  inactiveIcon: Icon(
                    Icons.wb_sunny,
                    color: Color(0xFFFFDF5D),
                  ),
                  onToggle: (val) {
                    Provider.of<AppStateNotifier>(context, listen: false)
                        .updateTheme(val);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    showSearch(
                        context: context, delegate: CustomSearchDelegates(i));
                  },
                )
              ]),

          extendBodyBehindAppBar: true,
          body:
          ListView.builder(
              itemCount:arabic[i]['titles'].length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    translationDialog(context, arabic, i, index,appState.isDarkMode);
                  },
                  child: Column(
                    children: [
                      ListTile(
                          leading: Image.asset('images/icons/pattern.png',
                            height: 38,width: 38,
                            color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                          title: Text(arabic[i]['titles'][index],)),
                      Divider(color: appState.isDarkMode ? Colors.black : Color(0xffa80000),)
                    ],
                  ),
                );
              }),

        );
      }
    );
  }
}
