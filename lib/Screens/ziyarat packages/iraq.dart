import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';

// import 'Webview_Form.dart';

class IraqPackages extends StatefulWidget {
  @override
  _IraqPackagesState createState() => _IraqPackagesState();
}

class _IraqPackagesState extends State<IraqPackages> {
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
              image: DecorationImage(fit: BoxFit.cover,
                  image: NetworkImage('https://images.pexels.com/photos/10114709/pexels-photo-10114709.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'))
            ),
            height: double.maxFinite,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    child: CarouselSlider(
                        items: [
                          Image.asset('images/packages/packages (1).jpg'),
                          Image.asset('images/packages/packages (2).jpg'),
                          Image.asset('images/packages/packages (3).jpg'),
                          Image.asset('images/packages/packages (4).jpg'),
                          Image.asset('images/packages/packages (5).jpg'),
                          Image.asset('images/packages/packages (6).jpg'),
                          Image.asset('images/packages/packages (7).jpg'),
                          Image.asset('images/packages/packages (8).jpg'),
                          Image.asset('images/packages/packages (9).jpg'),
                          Image.asset('images/packages/packages (10).jpg'),
                          Image.asset('images/packages/packages (11).jpg'),
                          Image.asset('images/packages/packages (12).jpg'),
                        ],
                        options: CarouselOptions(
                          // height: 400,
                          aspectRatio: 14 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,

                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        )),
                  ).frosted(blur: 2.4,padding: EdgeInsets.all(5)),
                  SizedBox(
                    height: 30,
                  ),
                  Container(            padding: EdgeInsets.symmetric(horizontal: 10),

                    child: Column(
                      children: [
                        Container(
                          decoration: ShapeDecoration(

                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)
                              )
                          ),                        padding: const EdgeInsets.all(20.0),
                          child: Container(

                              child: Image.asset('images/home_banner1.jpeg')),
                        ).frosted(blur: 2.4,padding: EdgeInsets.all(5),borderRadius: BorderRadius.circular(12)),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          child: Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: ShapeDecoration(

                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(24),bottomLeft: Radius.circular(24))
                                )
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: appState.isDarkMode?Colors.white:Color(0xffa80000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height * 0.02),
                            ),
                            // onPressed: () => Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => WebViewForm()
                            //     )),
                          ).frosted(blur: 2.4,padding: EdgeInsets.all(5),borderRadius: BorderRadius.circular(12)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: ShapeDecoration(

                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)
                              )
                          ),                        padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(

                            ),
                            child: Image.asset('images/banner.jpg'),
                          ),
                        ).frosted(blur: 2.4,padding: EdgeInsets.all(5),borderRadius: BorderRadius.circular(12)),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          child: Container(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            decoration: ShapeDecoration(

                                shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(24),bottomLeft: Radius.circular(24))
                              )
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: appState.isDarkMode?Colors.white:Color(0xffa80000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height * 0.02),
                            ),
                            // onPressed: () => Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => WebViewForm()
                            //     )),
                          ).frosted(blur: 2.4,padding: EdgeInsets.all(5),borderRadius: BorderRadius.circular(12)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
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
