import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../Widgets/time_card_widget.dart';
class Adhan extends StatefulWidget {
  @override
  _AdhanState createState() => _AdhanState();
}

class _AdhanState extends State<Adhan> {
  Map<String, dynamic>? azans;
  final List<String> TimeName=['Imsak','Fajr','Sunrise','Dhuhr','Asr','Sunset','Maghrib','Isha','Midnight'];
  final List<IconData> TimeIcon=[CupertinoIcons.sunrise,CupertinoIcons.sunrise_fill,CupertinoIcons.sun_haze,CupertinoIcons.sun_max_fill,CupertinoIcons.sun_min,CupertinoIcons.sunset,CupertinoIcons.sunset_fill,CupertinoIcons.moon,CupertinoIcons.moon_stars];
  Future giveAzanTimes() async {
    var client = http.Client();
    try {
      // Geolocator geoLocator = Geolocator();

      bool check = await Geolocator.checkPermission().then((value) async {
        print(value.toString());
        if (value == LocationPermission.denied) {
          await Geolocator.requestPermission();
          await giveAzanTimes();
          setState(() {});
          return true;
        } else if (value == LocationPermission.deniedForever) {
          await Geolocator.requestPermission();
          await giveAzanTimes();
          setState(() {});
          return true;
        }
        return false;
      });
      debugPrint(check.toString());

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      print("black");
      List<Placemark> p =
      await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = p[0];
      print("City: ${place.locality}");
      print("Country: ${place.country}");
      var u =
          "http://api.aladhan.com/v1/timingsByCity?city=${place.locality}&country=${place.country}&method=0";
      var r = await http.get(Uri.parse(u));
      //model=azanModelFromJson(r.body);
      print(u);
      print(json.decode(r.body)['data']['timings']);
      print(json.decode(r.body)['data']['timings']['Fajr'].toString());

      return json.decode(r.body)['data']['timings'];
    } catch (e) {
      print(e.toString());
    }
    client.close();
  }

  //AzanNotifications azanNotifications = AzanNotifications();
  @override
  void initState() {
    // setAzan();
    super.initState();
  }

  // setAzanSync() {
  //   print('Fajr :' + azans['Fajr'].toString());
  //   print('Dhuhr :' + azans['Dhuhr'].toString());
  //   print('Maghrib :' + azans['Maghrib'].toString());
  //
  //   azanNotifications.scheduleAzanTime(azans['Fajr']);
  //   azanNotifications.scheduleAzanTime(azans['Dhuhr']);
  //   azanNotifications.scheduleAzanTime(azans['Maghrib']);
  // }

  // setAzan() async {
  //   await giveAzanTimes().then((value) {
  //     print('Fajr :' + value['Fajr'].toString());
  //     print('Dhuhr :' + value['Dhuhr'].toString());
  //     print('Maghrib :' + value['Maghrib'].toString());

  //     azanNotifications.scheduleAzanTime(value['Fajr']);
  //     azanNotifications.scheduleAzanTime(value['Dhuhr']);
  //     azanNotifications.scheduleAzanTime(value['Maghrib']);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: ShapeDecoration(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(28))),
      child: (azans != null && azans!.isNotEmpty)
          ? ListView.builder(
          scrollDirection: Axis.horizontal,

          itemCount: TimeName.length,
          itemBuilder: (BuildContext context, int index) {
            return TimeCard(
              iconName:TimeIcon[index],
              Name: TimeName[index], subName: azans?[TimeName[index]]?.substring(0, 5),
            );
          })
          : FutureBuilder(
        future: giveAzanTimes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                "Loading Adhan timings...\nPlease ensure that GPS is tuned on.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            print(snapshot.error);
            return InkWell(
              onTap: () async {
                await giveAzanTimes();
              },
              child: const Center(
                child: Text(
                  "Please check your internet connection or restart the app\nOr give GPS permission to use location.",
                ),
              ),
            );
          }
          if (snapshot.data != null && snapshot.hasData) {
            azans = snapshot.data;
            //setAzanSync();
            return
              ListView.builder(
                  scrollDirection: Axis.horizontal,

                  itemCount: TimeName.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TimeCard(
                      iconName: TimeIcon[index],
                      Name: TimeName[index], subName: azans?[TimeName[index]].substring(0, 5),
                    );
                  });

          } else {
            return InkWell(
              onTap: () async {
                await giveAzanTimes();
              },
              child: const Center(
                child: Text(
                  "Please check your internet connection or restart the app\nOr give GPS permission to use location.",
                  softWrap: true,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}