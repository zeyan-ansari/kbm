import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:kbm/global_const.dart';
import 'package:provider/provider.dart';

import 'Helper/App_notifier.dart';
import 'Screens/compass/compass_screen.dart';
import 'Screens/secondary_screen.dart';
import 'Screens/tasweeh_screen.dart';
import 'Widgets/time_card_widget.dart';
import 'Widgets/utility_card_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Map<String, String> imgList = {
    'Tasweeh': 'images/icons/bead.png',
    'Al Quran': 'images/icons/book.png',
    'K.B.M Ziyarat Packages': 'images/icons/kaaba.png',
    'Taqibaat': 'images/icons/rug.png',
    'Dua': 'images/icons/praying.png',
    'Dsua': 'images/icons/window.png',
    'Sadaqah': 'images/icons/sadaqah.png',
    'K.B.M Ziyarat Videos': 'images/icons/you.png',
    'K.B.M Safare Ishq(Spiritual Journey)': 'images/icons/mosque.png',
  };

  @override
  Widget build(BuildContext context) {
    final List routeName = [
      TasweehScreen(title: imgList.keys.elementAt(0),),
      SecondaryScreen(title: imgList.keys.elementAt(1)),
    ];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return Scaffold(
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration:  BoxDecoration(
                    color:appState.isDarkMode?Colors.black:Color(0xffa80000),
                  ),
                  child: Image.asset(
                    'images/icons/logo.png',
                  ),
                ),
                ListTile(
                  title: const Text('Info'),
                  leading: const Icon(CupertinoIcons.info),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Waqf'),
                  leading: const Icon(CupertinoIcons.circle_grid_hex),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Whatsapp'),
                  leading: const Icon(Icons.whatsapp),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Instagram'),
                  leading: const Icon(FontAwesome.instagram),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Youtube'),
                  leading: const Icon(FontAwesome.youtube),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  title: const Text('Reviews'),
                  leading: const Icon(CupertinoIcons.star_circle),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  dense: false,
                  title: const Text('DarkMode'),
                  leading: Transform.scale(
                    scale: 0.6,
                    child: CupertinoSwitch(
                      activeColor: const Color(0xffa80000),
                      value: Provider.of<AppStateNotifier>(context).isDarkMode,
                      onChanged: (boolVal) {
                        Provider.of<AppStateNotifier>(context, listen: false)
                            .updateTheme(boolVal);
                      },
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),
              ],
            ),
          ),
          body: NestedScrollView(
                  physics: const BouncingScrollPhysics(),
                  headerSliverBuilder: (context, innerScrolled) => <Widget>[
                        SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          sliver: SliverAppBar(
                            backgroundColor:  appState.isDarkMode?Colors.black:Color(0xffa80000),
                            // surfaceTintColor: Colors.white,
                            actions: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Compass(title:'Qiblah')),
                                  );
                                },
                                child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 15),
                                    child: const Icon(
                                      CupertinoIcons.compass,
                                      size: 27,
                                    )),
                              )
                            ],
                            leading: InkWell(
                                onTap: () => Scaffold.of(context).openDrawer(),
                                child: const Icon(
                                  CupertinoIcons.settings,
                                  size: 25,
                                )),
                            pinned: true,
                            stretch: true,
                            title: const Text(
                              '5 Rajab 1444',
                              style: TextStyle(fontSize: 16),
                            ),
                            expandedHeight: 150,
                            flexibleSpace: ShaderMask(
                              blendMode:appState.isDarkMode? BlendMode.dst:BlendMode.overlay,
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: <Color>[
                                    // Colors.black.withOpacity(0.8),
                                    Color(0xffa80000),
                                    Color(0xffa80000),
                                    Color(0xffa80000),
                                  ],
                                  tileMode: TileMode.clamp,
                                ).createShader(bounds);
                              },
                              child: FlexibleSpaceBar(
                                  stretchModes: const <StretchMode>[
                                    StretchMode.zoomBackground,
                                    StretchMode.blurBackground,
                                  ],
                                  background: Container(
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'images/bg.jpeg',
                                            ),
                                            fit: BoxFit.fill)),
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 15),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: const [
                                            TimeCard(
                                              iconName: CupertinoIcons.sunrise,
                                              Name: 'Fajr',
                                            ),
                                            TimeCard(
                                              iconName: CupertinoIcons.sun_haze,
                                              Name: 'Sunrise',
                                            ),
                                            TimeCard(
                                              iconName: CupertinoIcons.sun_min,
                                              Name: 'Dhuhr',
                                            ),
                                            TimeCard(
                                              iconName: CupertinoIcons.sunset,
                                              Name: 'Maghrib',
                                            ),
                                            TimeCard(
                                              iconName: CupertinoIcons.moon_stars,
                                              Name: 'MidNight',
                                            ),
                                            TimeCard(
                                              iconName: CupertinoIcons.sunrise,
                                              Name: 'Fajr',
                                            ),
                                            TimeCard(
                                              iconName: CupertinoIcons.sun_haze,
                                              Name: 'Sunrise',
                                            ),
                                            TimeCard(
                                              iconName: CupertinoIcons.sun_min,
                                              Name: 'Dhuhr',
                                            ),
                                            TimeCard(
                                              iconName: CupertinoIcons.sunset,
                                              Name: 'Maghrib',
                                            ),
                                            TimeCard(
                                              iconName: CupertinoIcons.moon_stars,
                                              Name: 'MidNight',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                  body: Container(
                      decoration: const BoxDecoration(color: Colors.transparent),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 68,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10),
                              child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 120,
                                          childAspectRatio: 1 / 1,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemCount: imgList.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  routeName.elementAt(index)),
                                        );
                                      },
                                      child: UtilityCard(
                                          imgName: imgList.values.elementAt(index),
                                          name: imgList.keys.elementAt(index)),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      )))

        );
      }
    );
  }
}
