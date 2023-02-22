import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import '../register_form.dart';

// import 'Webview_Form.dart';

class IranPackages extends StatefulWidget {
  @override
  _IranPackagesState createState() => _IranPackagesState();
}

class _IranPackagesState extends State<IranPackages> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child:  Consumer<AppStateNotifier>(
                    builder: (context, appState, child) {
                      return CustomAppBar(Name: 'K.B.M Ziyarat Packages', isCompass: true, isDark:appState.isDarkMode ,);
                    }
                )),
            body: Container(
              decoration: BoxDecoration(

              color: Colors.black
              ),
              height: double.maxFinite,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/coming-soon5.png',fit: BoxFit.fitWidth,)
                ],
              ),
            ),
          );
        }
    );
  }
}
