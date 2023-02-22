import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import 'Webview_Form.dart';

class Reviews extends StatefulWidget {
  @override
  _ReviewsState createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return Stack(
          children: [
            Container(height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/review.jpeg"),

                  fit: BoxFit.cover,
                ),
              ),).blurred(blur: 5.2,colorOpacity: 0.4,blurColor:  appState.isDarkMode?Colors.black:Colors.white,),
            Container(height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.transparent
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                bottomNavigationBar:  GestureDetector(
                  child: Container(height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.all( 20),
                    decoration: ShapeDecoration(

                        color: appState.isDarkMode?Colors.black:Color(0xffa80000),
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )
                    ),
                    child: Center(
                      child: Text(
                        'Submit a feedback',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.height * 0.02),
                        ),
                      ),
                    ),
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WebViewForm())),
                ),
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(50),
                    child:  Consumer<AppStateNotifier>(
                        builder: (context, appState, child) {
                          return CustomAppBar(Name: 'K.B.M Review\'s', isCompass: true, isDark:appState.isDarkMode ,);
                        }
                    )),
                body: Container(
                  height: double.maxFinite,

                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(width: double.infinity,
                          // margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: ShapeDecoration(

                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              )
                          ),
                          child: CarouselSlider(
                              items: [
                                Image.asset('images/reviews/reviews (1).jpg'),
                                Image.asset('images/reviews/reviews (2).jpg'),
                                Image.asset('images/reviews/reviews (3).jpg'),
                                Image.asset('images/reviews/reviews (4).jpg'),
                                Image.asset('images/reviews/reviews (5).jpg'),
                                Image.asset('images/reviews/reviews (6).jpg'),
                                Image.asset('images/reviews/reviews (7).jpg'),
                                Image.asset('images/reviews/reviews (8).jpg'),
                                Image.asset('images/reviews/reviews (9).jpg'),
                                Image.asset('images/reviews/reviews (10).jpg'),
                                Image.asset('images/reviews/reviews (11).jpg'),
                                Image.asset('images/reviews/reviews (12).jpg'),
                                Image.asset('images/reviews/reviews (13).jpg'),
                                Image.asset('images/reviews/reviews (14).jpg'),
                                Image.asset('images/reviews/reviews (15).jpg'),
                                Image.asset('images/reviews/reviews (16).jpg'),
                                Image.asset('images/reviews/reviews (17).jpg'),
                                Image.asset('images/reviews/reviews (18).jpg'),
                                Image.asset('images/reviews/reviews (19).jpg'),
                                Image.asset('images/reviews/reviews (20).jpg'),
                                Image.asset('images/reviews/reviews (21).jpg'),
                                Image.asset('images/reviews/reviews (22).jpg'),
                                Image.asset('images/reviews/reviews (23).jpg'),
                                Image.asset('images/reviews/reviews (24).jpg'),
                                Image.asset('images/reviews/reviews (25).jpg'),
                              ],
                              options: CarouselOptions(
                                height: MediaQuery.of(context).size.height * 0.5,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: false,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration: Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
