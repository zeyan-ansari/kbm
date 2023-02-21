import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Helper/App_notifier.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return  Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return CarouselSlider(
            items: [
              Container(
                  width: double.infinity,
                  decoration: ShapeDecoration(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )
                  ),
                  padding: EdgeInsets.all(15),
                  child: Image.asset('images/home_banner1.jpeg')),
              Container(width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: ShapeDecoration(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )
                  ),
                  padding: EdgeInsets.all(15),
                  child: Image.asset('images/banner.jpg')),
            ],
            options: CarouselOptions(
              height: 400,
              aspectRatio: 4/4,
              viewportFraction:1,
              initialPage: 0,
              enableInfiniteScroll: true,

              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.linearToEaseOut,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
            ));
      }
    );
  }
}
