import 'package:flutter/material.dart';
import 'package:kbm/Helper/App_notifier.dart';
import 'package:provider/provider.dart';

import '../../Widgets/custom_app_bar.dart';
import '../al-quran/chapter_Screen.dart';
import 'data/safardesc.dart';
import 'data/safarrdata.dart';


class SafarHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppBar(
                Name: 'Safar',
                isCompass: false,
                isDark: appState.isDarkMode,
              )),
          extendBodyBehindAppBar: true,
          body: ListView.builder(
              itemCount: safar.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return SafarPage(descr, index);
                    }));
                  },
                  child: Column(
                    children: [
                      ListTile(
                          leading: Image.asset('images/icons/pattern.png',
                            height: 38,width: 38,
                            color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                          title: Text(safar[index])),
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

class SafarPage extends StatelessWidget {
  final List<Map<String, dynamic>> descr;
  final int i;
  SafarPage(this.descr, this.i);
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppBar(
                Name: descr[i]['name'],
                isCompass: false,
                isDark: appState.isDarkMode,
              )),

          extendBodyBehindAppBar: true,
          body:
          ListView.builder(
              itemCount: descr[i]['bodies'].length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AttsPage(index, descr[i]['bodies'])));
                  },
                  child: Column(
                    children: [
                      ListTile(
                          leading: Image.asset('images/icons/pattern.png',
                            height: 38,width: 38,
                            color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                          title: Text( descr[i]['bodies'][index]['title'])),
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
