import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../Helper/App_notifier.dart';

class DisplayPage extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final int index;

  DisplayPage(this.items, this.index);

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  dynamic colors = [Colors.black, Colors.white];
  double fontSize = 25.0;
  late List<String> hadiths;
  @override
  void initState() {
    hadiths = widget.items[widget.index]['text'].split("___________");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.items[widget.index]['name'],  style: const TextStyle(fontSize: 16),),
            backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
            // surfaceTintColor: Colors.white,
            actions: [

              FlutterSwitch(
                width: 45.0,
                height: 25.0,
                toggleSize: 20.0,
                value: Provider.of<AppStateNotifier>(context).isDarkMode,
                borderRadius: 45.0,
                padding: 1.0,
                activeToggleColor: Color(0xFF6E40C9),
                inactiveToggleColor: Color(0xFF2F363D),
                activeSwitchBorder: Border.all(
                  color: Colors.black38,
                  width: 1.0,
                ),
                inactiveSwitchBorder: Border.all(
                  color: Color(0xFFD1D5DA),
                  width: 1.0,
                ),
                activeColor: Colors.white24,
                inactiveColor: Colors.white,
                activeIcon: Icon(
                  Icons.nightlight_round,
                  color: Color(0xFFF8E3A1),
                ),
                inactiveIcon: Icon(
                  Icons.wb_sunny,
                  color: Color(0xFFFFDF5D),
                ),
                onToggle: (val) {
                  Provider.of<AppStateNotifier>(context, listen: false)
                      .updateTheme(val);
                },
              ),
              const SizedBox(
                width: 7,
              ),
            ],
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(CupertinoIcons.back)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(17.0),
            child: ListView.separated(
              separatorBuilder: (context, i) => Divider(),
              itemCount: hadiths.length,
              itemBuilder: (context, i) => Column(
                children: [
                  SelectableText(
                    hadiths[i],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: appState.isDarkMode ? Colors.white : const Color(0xffa80000),
                      fontSize: 23,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.favorite,
                      //     color: Colors.red,
                      //   ),
                      //   onPressed: () {

                      //   },
                      // ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Share.share(hadiths[i]);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
