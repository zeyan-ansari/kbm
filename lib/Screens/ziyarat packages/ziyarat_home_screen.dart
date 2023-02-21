import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:kbm/Screens/ziyarat%20packages/iraq.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/utility_card_widget.dart';

class ZiyaratHome extends StatefulWidget {
  final String title;
  const ZiyaratHome({Key? key, required this.title}) : super(key: key);

  @override
  State<ZiyaratHome> createState() => _ZiyaratHomeState();
}
final Map<String, String> imgList = {
  'Iraq': 'images/iraq.jpeg',
  'Iran': 'images/iran.jpeg',
};
class _ZiyaratHomeState extends State<ZiyaratHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child:  Consumer<AppStateNotifier>(
              builder: (context, appState, child) {
              return CustomAppBar(Name:widget.title, isCompass: false,isDark: appState.isDarkMode,);
            }
          )),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10),
                child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1 / 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemCount: imgList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => IraqPackages()),
                          );
                        },
                        child:
                        Consumer<AppStateNotifier>(
                            builder: (context, appState, child) {
                              return Container(alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                    color: appState.isDarkMode?Color(0xff121212):Colors.black.withOpacity(0.05),
                                    shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    )
                                ),
                                padding: EdgeInsets.symmetric(vertical: 0),

                                child:Column(mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    Expanded(child: Image.asset(imgList.values.elementAt(index),height: 30,fit: BoxFit.fitHeight,)),
                                    SizedBox(height: 13,),
                                    imgList.keys.elementAt(index).length>15?
                                    Container(width: 100,height: 25,
                                      child: Marquee(
                                        text: imgList.keys.elementAt(index),
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
                                    Container(
                                        margin:EdgeInsets.symmetric(vertical: 10),
                                        height: 30,child: Text(imgList.keys.elementAt(index),textAlign:TextAlign.center,style: TextStyle(color: appState.isDarkMode?Colors.white:Color(0xffa80000),fontSize: 15,overflow: TextOverflow.fade),)),
                                  ],
                                ) ,
                              ).asGlass(
                                  tintColor:appState.isDarkMode?Colors.transparent: Colors.white,
                                  clipBorderRadius: BorderRadius.circular(12)
                              );
                            }
                        )
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

