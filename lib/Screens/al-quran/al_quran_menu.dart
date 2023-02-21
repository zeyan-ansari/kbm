import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbm/Screens/al-quran/quran_home.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import 'chapter_Screen.dart';
import 'data/juz_data.dart';
import 'data/quran_other_data.dart';
import 'juz_screen.dart';



class AlQuranMenu extends StatefulWidget {
  final String title;
  const AlQuranMenu({Key? key, required this.title}) : super(key: key);

  @override
  State<AlQuranMenu> createState() => _AlQuranMenuState();
}

class _AlQuranMenuState extends State<AlQuranMenu> {
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
            itemCount: listItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => navigateToPage(context, index, listItems[index]),
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

void navigateToPage(BuildContext context, int index,String title) {
  Widget pageToNavigate;
  switch (index) {
    case 0:
      pageToNavigate = AlQuranHome(title:title ,);
      break;
    case 1:
      pageToNavigate =JuzHome( juzs);
      break;
    case 2:
      pageToNavigate = AttsPage(0, quranOthers);
      break;
    case 3:
      pageToNavigate =  AttsPage(1, quranOthers);
      break;
    case 4:
      pageToNavigate =  AttsPage(2, quranOthers);
      break;
    default:
      pageToNavigate = AlQuranHome(title:title ,);
  }
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => pageToNavigate));
}