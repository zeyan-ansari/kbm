import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import '../ziyarat-masoomeen/display_screen.dart';
import 'data/masoomeen_hadith_data.dart';

class MasumeenHadith extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppBar(
                Name: 'Life History',
                isCompass: false,
                isDark: appState.isDarkMode,
              )),
          extendBodyBehindAppBar: true,
          body:
          ListView.builder(
              itemCount: masoomeenh.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DisplayPage(masoomeenh, index)));
                  },
                  child: Column(
                    children: [
                      ListTile(
                          leading: Image.asset('images/icons/pattern.png',
                            height: 38,width: 38,
                            color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                          title: Text(masoomeenh[index]['name'],)),
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
