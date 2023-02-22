import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../Helper/App_notifier.dart';
import '../Screens/compass/compass_screen.dart';

class CustomAppBar extends StatefulWidget {
  final String Name;
  final bool isCompass;
  final bool isDark;
  const CustomAppBar({
    Key? key,
    required this.Name,
    required this.isCompass,
    required this.isDark,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  AppBar build(BuildContext context) {
    return
      AppBar(
      backgroundColor: widget.isDark ? Colors.black : Color(0xffa80000),
      // surfaceTintColor: Colors.white,
      actions: [
        !widget.isCompass
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Compass(title: 'Qiblah')),
                  );
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Icon(
                      CupertinoIcons.compass,
                      size: 27,
                    )),
              )
            : SizedBox(),
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

      title: Text(
        widget.Name,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
