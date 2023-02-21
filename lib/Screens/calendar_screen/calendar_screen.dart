import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import '../ziyarat-masoomeen/display_screen.dart';
import 'data/data.dart';

class CalendarHome extends StatefulWidget {
  @override
  State<CalendarHome> createState() {
    return AppState();
  }
}

class AppState extends State<CalendarHome> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Consumer<AppStateNotifier>(
                  builder: (context, appState, child) {
                    return CustomAppBar(Name:'Shia Islamic Calendar', isCompass: true,isDark:appState.isDarkMode);
                  }
              )),
          extendBodyBehindAppBar: true,
          body:
          ListView.builder(
              itemCount:calendar.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayPage(calendar, index)));              },
                  child: Column(
                    children: [
                      ListTile(
                          leading: Image.asset('images/icons/pattern.png',
                            height: 38,width: 38,
                            color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                          title: Text( calendar[index]['name'])),
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

class EachList extends StatelessWidget {
  final String name;
  final int index;
  EachList(this.index, this.name);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DisplayPage(calendar, index)));
      },
      child: Card(
        color: Colors.black54,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black54.withOpacity(0.3),
            child: Text((index + 1).toString()),
          ),
          title: Text(
            name,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class CalendarPage extends StatefulWidget {
  final List<Map<String, dynamic>> calendar;
  final int i;
  CalendarPage(this.calendar, this.i);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Consumer<AppStateNotifier>(
                  builder: (context, appState, child) {
                    return CustomAppBar(Name:'Shia Islamic Calendar', isCompass: true,isDark:appState.isDarkMode);
                  }
              )),
          body:
          ListView.builder(
              itemCount:widget.calendar[widget.i]['duastitles'].length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DisplayPage(
                              widget.calendar,
                              index,
                            )));              },
                  child: Column(
                    children: [
                      ListTile(
                          leading: Image.asset('images/icons/pattern.png',
                            height: 38,width: 38,
                            color: appState.isDarkMode ? Colors.black : Color(0xffa80000),),

                          title: Text( widget.calendar[widget.i]['duastitles'][index],)),
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
