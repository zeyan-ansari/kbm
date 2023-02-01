import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:glass/glass.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../Helper/App_notifier.dart';

class UtilityCard extends StatelessWidget {
  final String imgName;
  final String name;
  const UtilityCard({
    Key? key, required this.imgName, required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return Container(alignment: Alignment.center,
          decoration: ShapeDecoration(
              color: appState.isDarkMode?Color(0xff121212):Colors.black.withOpacity(0.01),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
              )
          ),
          padding: EdgeInsets.all(15),
          child:Column(mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Expanded(child: Image.asset(imgName,color: appState.isDarkMode?Colors.white:Color(0xffa80000),height: 30,)),
              SizedBox(height: 13,),
             name.length>15?
             Container(width: 100,height: 25,
               child: Marquee(
                 text: name,
                 velocity: 25.0,
                 style: TextStyle(color: appState.isDarkMode?Colors.white:Color(0xffa80000)),
                 pauseAfterRound: Duration(milliseconds: 0),
                 startPadding: 10.0,
                 blankSpace: 10,
                 accelerationDuration: Duration(milliseconds: 700),
                 accelerationCurve: Curves.linear,
                 decelerationDuration: Duration(milliseconds: 0),
                 decelerationCurve: Curves.linear,
               ),
             ):
             Container(height: 20,child: Text(name,textAlign:TextAlign.center,style: TextStyle(color: appState.isDarkMode?Colors.white:Color(0xffa80000),fontSize: 15,overflow: TextOverflow.fade),)),
            ],
          ) ,
        ).asGlass(
          tintColor:appState.isDarkMode?Colors.transparent: Colors.white,
          clipBorderRadius: BorderRadius.circular(12)
        );
      }
    );
  }
}
