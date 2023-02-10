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
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUAFjWAxHZneR2kF_7qu2RJFXk-vLUZhj6w_f_1zwAKeO8InH1TpPlRfolalR-p4Q3X2k&usqp=CAU'),
              Image.network('https://thumbs.dreamstime.com/b/christmas-background-banner-format-tree-branches-holly-star-anise-pink-copy-space-157176582.jpg'),
              Image.network('https://thumbs.dreamstime.com/b/merry-christmas-happy-new-year-card-festive-green-fir-branches-holiday-object-pale-pink-background-123729608.jpg'),
            ],
            options: CarouselOptions(
              height: 150,
              aspectRatio: 2/1,
              viewportFraction: 0.9,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ));
      }
    );
  }
}
