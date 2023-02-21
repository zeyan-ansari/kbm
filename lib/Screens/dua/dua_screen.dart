import 'package:flutter/material.dart';
import 'package:kbm/Screens/dua/dua_data.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../common_menu/commmon_menu_screen.dart';
import '../al-quran/chapter_Screen.dart';
class DuaScreen extends StatefulWidget {
  const DuaScreen({Key? key, required  this.title}) : super(key: key);
  final String title;
  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {


  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dua =  duas.sublist(0, 35);
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              Name: 'Dua\'s',
              isCompass: false,
              isDark: appState.isDarkMode,
            )),
        body:ListView.builder(
            itemCount: dua.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AttsPage(index, dua)));
                },
                child: Column(
                  children: [
                    ListTile(
                        leading: Image.asset('images/icons/pattern.png',
                          height: 38,width: 38,
                          color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                        title: Text('${ dua[index]['title']}')),
                    Divider(color: appState.isDarkMode ? Colors.black : Color(0xffa80000),)
                  ],
                ),
              );
            }),
      );
    });

  }
}
