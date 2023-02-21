import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int adjustment = 0;
  Map<String, dynamic>? calendar;

  Future giveCalendar() async {
    var client = http.Client();
    try {
      var u =
          'http://api.aladhan.com/v1/gToH?date=${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}&adjustment=$adjustment';
      var r = await http.get(Uri.parse(u));
      String date = json.decode(r.body)['data']['hijri']['date'];
      Map<String, dynamic> m = new Map<String, dynamic>();
      String hDate = (int.parse(date.substring(0, 2))).toString();
      m['day'] = hDate;
      m['month_name'] = json.decode(r.body)['data']['hijri']['month']['en'];
      m['year'] = date.substring(6, 10);
      //var url = 'https://shiaazanapi.herokuapp.com/calendar';//'https://shiaazanapi.herokuapp.com/calendar';
      //var response = await http.post(url);
      return m;
    } catch (e) {
      print(e.toString());
    }
    client.close();
  }

  _fetchValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("hijri")) {
      setState(() {
        adjustment = prefs.getInt("hijri")!;
      });
    } else {
      setState(() {
        adjustment = 0;
      });
    }
  }

  @override
  void initState() {
    _fetchValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Center(
        child: (calendar != null && calendar!.isNotEmpty)
            ? SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Text(
                "${calendar?['day'].toString()}  ",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize:
                    16),
              ),
              Text(
                "${calendar?['month_name']} ${calendar?['year']} Hijri",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize:
                    16),
              ),
            ],
          ),
        )
            : FutureBuilder(
          future: giveCalendar(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.hasData == false) {
              return Center(
                child: Column(
                  children: const [
                    Text(
                      "Loading islamic date...\nPlease ensure that GPS is tuned on.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8
                      ),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "Please check your internet connection or restart the app.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 8
                  ),
                ),
              );
            }
            if (snapshot.hasData && snapshot.data != null) {
              calendar = snapshot.data;
            }
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "${calendar?['day'].toString()}  ",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize:
                        16),
                  ),
                  Text(
                    "${calendar?['month_name']} ${calendar?['year']} Hijri",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize:
                        16),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
