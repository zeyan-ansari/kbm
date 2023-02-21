import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbm/Screens/al-quran/data/juz_data.dart';
import 'package:kbm/Screens/al-quran/data/quran_data.dart';
import 'package:kbm/common_menu/commmon_menu_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import 'chapter_Screen.dart';



class JuzHome extends StatefulWidget {
  const JuzHome(List<Map<String, String>> juzs, {Key? key,}) : super(key: key);

  @override
  State<JuzHome> createState() => _JuzHomeState();
}

class _JuzHomeState extends State<JuzHome> {
  List<String> listItems = [
    "Sipara 1",
    "Sipara 2",
    "Sipara 3",
    "Sipara 4",
    "Sipara 5",
    "Sipara 6",
    "Sipara 7",
    "Sipara 8",
    "Sipara 9",
    "Sipara 10",
    "Sipara 11",
    "Sipara 12",
    "Sipara 13",
    "Sipara 14",
    "Sipara 15",
    "Sipara 16",
    "Sipara 17",
    "Sipara 18",
    "Sipara 19",
    "Sipara 20",
    "Sipara 21",
    "Sipara 22",
    "Sipara 23",
    "Sipara 24",
    "Sipara 25",
    "Sipara 26",
    "Sipara 27",
    "Sipara 28",
    "Sipara 29",
    "Sipara 30",
  ];



  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              Name: 'Sipara Wise',
              isCompass: false,
              isDark: appState.isDarkMode,
            )),
        body:ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AttsPage(index, juzs)));
                },
                child: Column(
                  children: [
                    ListTile(
                        leading: Image.asset('images/icons/pattern.png',
                          height: 38,width: 38,
                          color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                        title: Text(listItems[index])),
                    Divider(color: appState.isDarkMode ? Colors.black : Color(0xffa80000),)
                  ],
                ),
              );
            }),
      );
    });

  }
}

