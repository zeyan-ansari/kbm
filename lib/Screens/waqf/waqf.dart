import 'package:blur/blur.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';

class Waqf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
            backgroundColor: Colors.black54,
            appBar:  PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomAppBar(
                  Name:'Waqf',
                  isCompass: false,
                  isDark: appState.isDarkMode,
                )),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/islam.jpeg"),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.9), BlendMode.dst),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(padding: const EdgeInsets.symmetric(horizontal: 0.10,vertical: 15),

                  color: Colors.black54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(width: MediaQuery.of(context).size.width,
                        child: Text('بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Alqalam',
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 10,),
                      Text('YA ALI(AS) MADAD',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                  Container(
                    decoration: BoxDecoration(
                      // color: Colors.black
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 430,
                    ).blurred(
                        overlay: CarouselSlider(
                  items: [
                  Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          )
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          ClipRRect(child: Image.asset('images/waqf1.jpeg')  ,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Marhoom Syed Noubahar\n Shah Bukhari (Shaheed)',                          textAlign: TextAlign.center,

                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )),
                      Container(width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: ShapeDecoration(
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              )
                          ),
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              ClipRRect(
                                child: Image.asset('images/waqf2.jpeg'),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              SizedBox(height: 10,),

                              Text(
                                'Marhooma Syeda Fouzia Zahra Bukhari \n(Kaneez e Malika e Fidak) Walida\n Syed Musa Kazim Bukhari ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                    ],
                      options: CarouselOptions(
                        height: 430,
                        aspectRatio: 1,
                        viewportFraction: 0.65,
                        initialPage: 0,
                        enableInfiniteScroll: true,

                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.linearToEaseOut,
                        enlargeCenterPage: false,
                        scrollDirection: Axis.horizontal,
                      )),
                        blur: 5.5,
                        borderRadius: BorderRadius.circular(24),
                        colorOpacity: 0.5,blurColor: Colors.black),
                  ),

                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(margin: EdgeInsets.all(10),
                          decoration:ShapeDecoration(
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '''This Humble Work is dedictaed to Mother of 11 Imams, Bibi Sayyeda(s.a), and Master of our Age, Maula Mahdi(a.t.f.s), May Allah(swt) Hasten His Reappearence.

This app was developed in the loving memory of Shohda-e-Karbala and:''',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ).blurred(overlay:Container(margin: EdgeInsets.all(10),
                          decoration:ShapeDecoration(
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '''This Humble Work is dedictaed to Mother of 11 Imams, Bibi Sayyeda(s.a), and Master of our Age, Maula Mahdi(a.t.f.s), May Allah(swt) Hasten His Reappearence.

This app was developed in the loving memory of Shohda-e-Karbala and:''',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ) ,
                            blur: 5.5,
                            borderRadius: BorderRadius.circular(24),
                            colorOpacity: 0.5,blurColor: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('''
                              
1. Marhoom Syed Noubahar Shah Bukhari (Shaheed) 


2. Marhooma Syeda Fouzia Zahra Bukhari (Kaneez e Malika e Fidak) Walida Syed Musa Kazim Bukhari 

3. Marhoom Syed Shoukat Abbas Bukhari 

4. Marhoom Syed Jalal Shah Bukhari

5. Marhooma Syed Riaz Hussain Shah

6. Marhooma Syeda Ghulam Jannat

7. Marhoom Shahid Ali (Azadaar)

''',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                              )),
                        ).blurred(
                            overlay: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text('''
                              
1. Marhoom Syed Noubahar Shah Bukhari (Shaheed) 


2. Marhooma Syeda Fouzia Zahra Bukhari (Kaneez e Malika e Fidak) Walida Syed Musa Kazim Bukhari 

3. Marhoom Syed Shoukat Abbas Bukhari 

4. Marhoom Syed Jalal Shah Bukhari

5. Marhooma Syed Riaz Hussain Shah

6. Marhooma Syeda Ghulam Jannat

7. Marhoom Shahid Ali (Azadaar)

''',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                  )),
                            ),
                            blur: 5.5,
                            borderRadius: BorderRadius.circular(24),
                            colorOpacity: 0.5,blurColor: Colors.black),
                      ),
                      Text(
                          "Please recite one Surah Fateha for all Marhoomeen and Mominaat.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      Text(
                        "اللهم عجل لوليك الفرج",textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.08,
                          fontFamily: "Alqalam",
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      )
                    ],
                  ),
                ),
              ),
            ));
      }
    );
  }
}
