import 'package:flutter/material.dart';
import 'package:kbm/Screens/eng2arabic/data/words_data.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import '../ziyarat-masoomeen/display_screen.dart';
import '../ziyarat-masoomeen/masoomeen_data.dart';
import 'data/translate_data.dart';



class EnglishToArabic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              Name: 'English to Persian',
              isCompass: false,
              isDark: appState.isDarkMode,
            )),
        extendBodyBehindAppBar: true,
        body:
        ListView.builder(
            itemCount: arabic.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WordsPage(arabic, index)));
                },
                child: Column(
                  children: [
                    ListTile(
                        leading: Image.asset('images/icons/pattern.png',
                          height: 38,width: 38,
                          color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                        title: Text(arabic[index]['name'],)),
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
