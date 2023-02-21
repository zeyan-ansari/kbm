import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbm/Screens/al-quran/data/quran_data.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import 'chapter_Screen.dart';
import 'data/quran_soon_data.dart';



class AlQuranHome extends StatefulWidget {
  final String title;
  const AlQuranHome({Key? key, required this.title}) : super(key: key);

  @override
  State<AlQuranHome> createState() => _AlQuranHomeState();
}

class _AlQuranHomeState extends State<AlQuranHome> {
  List<String> listItems = [
    "Surah Wise",
    "Sipara Wise",
    "Dua before reciting Qur'an",
    "Dua after reciting Qur'an",
    "Ayatul Kursi",
  ];


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
        body:ListView.builder(
            itemCount: quran.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AttsPage(index, qurans)));
                },
                child: Column(
                  children: [
                    ListTile(
                        leading: Image.asset('images/icons/pattern.png',
                          height: 38,width: 38,
                          color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                        title: Text(quran[index]['name'])),
                    Divider(color: appState.isDarkMode ? Colors.black : Color(0xffa80000),)
                  ],
                ),
              );
            }),
      );
    });
  }
}

