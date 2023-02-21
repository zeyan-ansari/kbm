import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Helper/App_notifier.dart';

void translationDialog(BuildContext context, List<Map<String, dynamic>> list,
    int outerIndex, int innerIndex, bool isDarkMode) {
  double screenWidth = MediaQuery.of(context).size.width;
  showModalBottomSheet<void>(
    shape: ContinuousRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(24),topLeft: Radius.circular(24),)),
    // context and builder are
    // required properties in this widget
    context: context,
    backgroundColor: isDarkMode?Colors.black : Colors.white,
    builder: (BuildContext context) {
      // we set up a container inside which
      // we create center column and display text

      // Returning SizedBox instead of a Container
      return Container(padding: EdgeInsets.all(18),
        decoration: ShapeDecoration(
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(48)
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children:  <Widget>[
              Container(
                height: 5,width: 50,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(66),
                  color: Colors.grey
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                decoration: ShapeDecoration(
                color: !isDarkMode?Colors.black : Color(0xffa80000),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(48)
                  )
              ),
                child: Text(list[outerIndex]['titles'][innerIndex], style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),),
              ),
              SizedBox(height: 15,),
              Text(list[outerIndex]['translatebody'][innerIndex], style: TextStyle(
                color: isDarkMode?Colors.white : Color(0xffa80000),
                fontSize: 18,
              ),),
            ],
          ),
        ),
      );
    },
  );
  // showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Consumer<AppStateNotifier>(builder: (context, appState, child) {
  //           return
  //
  //             AlertDialog(
  //             backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
  //             shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
  //             content: SingleChildScrollView(
  //               physics: BouncingScrollPhysics(),
  //               child: Column(
  //                 children: <Widget>[
  //                   Text(
  //                     list[outerIndex]['titles'][innerIndex],
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: screenWidth * 0.06,
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 5.0,
  //                   ),
  //                   Text(
  //                     list[outerIndex]['translatebody'][innerIndex],
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: screenWidth * 0.06,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             actions: <Widget>[
  //               MaterialButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 textColor: Colors.white,
  //                 color: Colors.black54,
  //                 child: Text("Close"),
  //               )
  //             ],
  //           );
  //         }
  //       );
  //     });
}
