import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kbm/Screens/al-quran/quran_home.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';



class CommonMenu extends StatefulWidget {
  final String title;
  final List<String> listItems;
  final List<Map<String, String>>? array;
  final List<Map<String, dynamic>>? masoomeen;


  const CommonMenu({Key? key, required this.title, required this.listItems, this.array, this.masoomeen}) : super(key: key);

  @override
  State<CommonMenu> createState() => _CommonMenuState();
}

class _CommonMenuState extends State<CommonMenu> {



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
            itemCount: widget.listItems.isEmpty?
            widget.array?.length:
            widget.listItems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => navigateToPage(context, index, widget.listItems[index]),
                child: Column(
                  children: [
                    ListTile(
                        leading: Image.asset('images/icons/pattern.png',
                          height: 38,width: 38,
                          color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                        title: Text(
                           widget.listItems.isEmpty?
                           '${widget.array![index]['title']}':
                           widget.listItems[index]
                        )),
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
      pageToNavigate =AlQuranHome(title:title ,);
      break;
    case 2:
      pageToNavigate = AlQuranHome(title:title ,);
      break;
    case 3:
      pageToNavigate = AlQuranHome(title:title ,);
      break;
    case 4:
      pageToNavigate = AlQuranHome(title:title ,);
      break;
    default:
      pageToNavigate = AlQuranHome(title:title ,);
  }
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => pageToNavigate));
}