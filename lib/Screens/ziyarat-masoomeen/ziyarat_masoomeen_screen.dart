import 'package:flutter/material.dart';
import 'package:kbm/Screens/dua/dua_data.dart';
import 'package:kbm/Screens/namaaz/namaaz_data.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../common_menu/commmon_menu_screen.dart';
import 'display_screen.dart';
import 'masoomeen_data.dart';
class MasoomeenScreen extends StatefulWidget {
  const MasoomeenScreen({Key? key, required  this.title}) : super(key: key);
  final String title;
  @override
  State<MasoomeenScreen> createState() => _MasoomeenScreenState();
}

class _MasoomeenScreenState extends State<MasoomeenScreen> {


  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dua =  masoomeen.sublist(0, 21);

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
            itemCount: dua.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) =>  DisplayPage(masoomeen, index)));
                },
                child: Column(
                  children: [
                    ListTile(
                        leading: Image.asset('images/icons/pattern.png',
                          height: 38,width: 38,
                          color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                        title: Text('${ masoomeen[index]['name']}')),
                    Divider(color: appState.isDarkMode ? Colors.black : Color(0xffa80000),)
                  ],
                ),
              );
            }),
      );
    });
  }
}
