import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kbm/Screens/dua/dua_data.dart';
import 'package:kbm/Screens/namaaz/namaaz_data.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../common_menu/commmon_menu_screen.dart';
import 'chapter_screen.dart';
class NamaazScreen extends StatefulWidget {
  const NamaazScreen({Key? key, required  this.title}) : super(key: key);
  final String title;
  @override
  State<NamaazScreen> createState() => _NamaazScreenState();
}

class _NamaazScreenState extends State<NamaazScreen> {


  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dua =  namaaz.sublist(0, 35);
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              Name: 'Namaaz',
              isCompass: false,
              isDark: appState.isDarkMode,
            )),
        body:ListView.builder(
            itemCount: namaaz.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  double textScale = MediaQuery.of(context).textScaleFactor;
                  Map<String, String> item = namaaz[index];
                  List<Widget> tabTitles = <Widget>[];
                  List<Widget> tabBodies = <Widget>[];
                  item.forEach((key, value) {
                    if (key != "title" && key != "audioUrl") {
                      tabTitles.add(Tab(
                        text: capitalize(key),
                      ));
                      tabBodies.add(SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: textScale * 25,
                          ),
                        ),
                      ));
                    }
                  });
                  SchedulerBinding.instance.addPostFrameCallback((_) {

                    // add your code here.

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AttPage(index, namaaz)));
                  });

                },
                child: Column(
                  children: [
                    ListTile(
                        leading: Image.asset('images/icons/pattern.png',
                          height: 38,width: 38,
                          color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                        title: Text( namaaz[index]['title']!)),
                    Divider(color: appState.isDarkMode ? Colors.black : Color(0xffa80000),)
                  ],
                ),
              );
            }),
      );
    });
  }
  void navigateToAttPage(BuildContext context, int index) {
    double textScale = MediaQuery.of(context).textScaleFactor;
    Map<String, String> item = namaaz[index];
    List<Widget> tabTitles = <Widget>[];
    List<Widget> tabBodies = <Widget>[];
    item.forEach((key, value) {
      if (key != "title" && key != "audioUrl") {
        tabTitles.add(Tab(
          text: capitalize(key),
        ));
        tabBodies.add(SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: textScale * 25,
            ),
          ),
        ));
      }
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {

      // add your code here.

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AttPage(index, namaaz)));
    });

  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
