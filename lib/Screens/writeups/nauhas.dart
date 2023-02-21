import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kbm/Screens/writeups/search_widget.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import 'data/writeup_data.dart';
import 'nauha_search.dart';
import 'nauhas_display.dart';
import 'nauhas_home_search.dart';



class NauhaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
          appBar:
          AppBar(
            backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
            // surfaceTintColor: Colors.white,
            actions: [

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
              PopupMenuButton<String>(
                onSelected: (choice) {
                  if (choice == "Search by Nauha Khwan") {
                    showSearch(
                        context: context, delegate: NauhaHomeSearchDelegate());
                  } else {
                    showSearch(
                        context: context, delegate: SearchByNauhaTitleDelegate());
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "Search by Nauha Khwan",
                    child: Text("Search by Nauha Khwan"),
                  ),
                  PopupMenuItem<String>(
                    value: "Search by Nauha",
                    child: Text("Search by Nauha Title"),
                  ),
                ],
              ),
              const SizedBox(
                width: 7,
              ),
            ],
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(CupertinoIcons.back)),

            title: Text(
              'Nauhas & Manqabats Writeups',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          extendBodyBehindAppBar: true,
          body:
          ListView.builder(
              itemCount: nauhas.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return NauhasPage(nauhas, index);
                    }));
                  },
                  child: Column(
                    children: [
                      ListTile(
                          leading: Image.asset('images/icons/pattern.png',
                            height: 38,width: 38,
                            color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                          title: Text(nauhas[index]['name'])),
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

class NauhasPage extends StatelessWidget {
  final List<Map<String, dynamic>> nauhas;
  final int i;
  NauhasPage(this.nauhas, this.i);
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
          appBar:
          AppBar(
            backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
            // surfaceTintColor: Colors.white,
            actions: [

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
                  showSearch(context: context, delegate: CustomSearchDelegate(i));
                },
              ),
              const SizedBox(
                width: 7,
              ),
            ],
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(CupertinoIcons.back)),

            title: Text(
              nauhas[i]['name'],
              style: const TextStyle(fontSize: 16),
            ),
          ),

          extendBodyBehindAppBar: true,
          body:
          ListView.builder(
              itemCount: nauhas[i]['nauhatitles'].length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return NauhaDisplay(i, index);
                    }));
                  },
                  child: Column(
                    children: [
                      ListTile(
                          leading: Image.asset('images/icons/pattern.png',
                            height: 38,width: 38,
                            color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                          title: Text(nauhas[i]['nauhatitles'][index])),
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
