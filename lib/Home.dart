import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:kbm/Screens/namaaz/namaaz_screen.dart';
import 'package:kbm/global_const.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Helper/App_notifier.dart';
import 'Screens/adhan/adhan_page.dart';
import 'Screens/al-quran/al_quran_menu.dart';
import 'Screens/ashaars/ashaar_home.dart';
import 'Screens/azaadari/azadaari_screen.dart';
import 'Screens/calendar/calendar.dart';
import 'Screens/calendar_screen/calendar_screen.dart';
import 'Screens/compass/compass_screen.dart';
import 'Screens/dua/dua_screen.dart';
import 'Screens/eng2Persian/eng2per_screen.dart';
import 'Screens/eng2arabic/eng2arab.dart';
import 'Screens/hadith/hadith_home.dart';
import 'Screens/masoomeen_life_history/masoomeen_home.dart';
import 'Screens/safar/safar_menu.dart';
import 'Screens/waqf/waqf.dart';
import 'Screens/writeups/nauhas.dart';
import 'Screens/youtube/kbm_youtube_channel.dart';
import 'Screens/ziyarat packages/ziyarat_home_screen.dart';
import 'Screens/tasweeh_screen.dart';
import 'Screens/ziyarat-masoomeen/ziyarat_masoomeen_screen.dart';
import 'Widgets/carousel_slider_widget.dart';
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
    'Namaaz': 'images/icons/rug.png',
    'Dua': 'images/icons/praying.png',
    'Ziyarat of Masoomeen(a.s)': 'images/icons/window.png',
    'K.B.M Ziyarat Videos': 'images/icons/you.png',
    'K.B.M Safare Ishq(Spiritual Journey)': 'images/icons/mosque.png',
    'Masoomeen Life History': 'images/icons/book.png',
    'Masoomeen Hadith': 'images/icons/setting.png',
    'Nauha & Manqabat writeups': 'images/icons/book.png',
    'Ashaars writeups': 'images/icons/book.png',
    '40 Hadith on Azadari': 'images/icons/mosque.png',
    'English to Arabic Dictionary': 'images/icons/eng.png',
    'English to Persian Dictionary': 'images/icons/eng.png',
    'Islamic Calendar': 'images/icons/clock.png',
  };
  Future<void> openYoutube() async {
    const url = 'https://www.youtube.com/channel/UCvCxOCEs_bCaKwEh3Km_CrQ';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> openInstagram() async {
    const url = 'https://instagram.com/kbm_tours/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> openWhatsApp(context) async {
    if (Theme.of(context).platform != TargetPlatform.iOS) {
      try {
        // FlutterOpenWhatsapp.sendSingleMessage(
        //     "17186665553",
        //     "Salaam Alaikum,"
        //         "Ya Ali Madad (A.S)");
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> openWebsite() async {
    const url =
        'https://wa.me/17186665553?text=Salaam Alaikum,\n Ya Ali Madad (A.S)';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    final List routeName = [
      TasweehScreen(
        title: imgList.keys.elementAt(0),
      ),
      AlQuranMenu(title: imgList.keys.elementAt(1)),
      ZiyaratHome(title: imgList.keys.elementAt(2)),
      NamaazScreen(title: imgList.keys.elementAt(3)),
      DuaScreen(title: imgList.keys.elementAt(4)),
      MasoomeenScreen(title: imgList.keys.elementAt(5)),
      KBMYoutubeChannel(),
      SafarHome(),
      MasumeenHome(),
      MasumeenHadith(),
      NauhaHome(),
      AsharHome(),
      AzadariDisplay(),
      EnglishToArabic(),
      EnglishToPersian(),
      CalendarHome(),
    ];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
      return Scaffold(
          drawer:
          Container(
            child: Drawer(elevation: 0,
              // width: width*0.65,
              backgroundColor: Colors.transparent,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                    decoration: ShapeDecoration(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(58),
                      ),

                      // color:
                      //     appState.isDarkMode ? Colors.black : const Color(0xffa80000),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Waqf()),
                      );                    // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Whatsapp'),
                    leading: const Icon(FontAwesome.whatsapp),
                    onTap: () {
                      openWhatsApp(context);
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Instagram'),
                    leading: const Icon(FontAwesome.instagram),
                    onTap: () {
                      openInstagram();
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: const Text('Youtube'),
                    leading: const Icon(FontAwesome.youtube),
                    onTap: () {
                      openYoutube();
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
          ).frosted(blur: 10.5,frostColor: appState.isDarkMode?Colors.black:Colors.white,frostOpacity: 0.2),
          body: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerScrolled) => <Widget>[
                    SliverOverlapAbsorber(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      sliver: SliverAppBar(
                        backgroundColor: appState.isDarkMode
                            ? Colors.black
                            : const Color(0xffa80000),
                        // surfaceTintColor: Colors.white,
                        actions: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Compass(title: 'Qiblah')),
                              );
                            },
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                        centerTitle: true,
                        title: Calendar(),
                        expandedHeight: 150,
                        flexibleSpace: ShaderMask(
                          blendMode: appState.isDarkMode
                              ? BlendMode.dst
                              : BlendMode.overlay,
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
                                StretchMode.blurBackground,
                                StretchMode.blurBackground,
                              ],
                              background: Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'images/pexels-beytlik-7522164.jpg',
                                        ),
                                        fit: BoxFit.cover)),
                                child: Adhan(),
                              )),
                        ),
                      ),
                    )
                  ],
              body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.15,
                      ),
                      // Container(
                      //     height:150,child: CarouselSliderWidget()),
                      Container(
                        decoration: ShapeDecoration(
                            color: appState.isDarkMode?const Color(0xff121212):Colors.black.withOpacity(0.05),
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            )
                        ),

                        child: Theme(
                          data: ThemeData().copyWith(dividerColor: Colors.transparent),

                          child: ExpansionTile(
                            // backgroundColor: Colors.black.withOpacity(0.05),
                            // collapsedBackgroundColor: appState.isDarkMode
                            //     ? Color(0xff121212)
                            //     : Colors.black.withOpacity(0.05),
                            leading: Image.asset(
                              'images/icons/megaphone.png',
                              height: 30,
                              color: appState.isDarkMode
                                  ? Colors.white
                                  : const Color(0xffa80000),
                            ),
                            title: Text(
                              'Announcement\'s',
                              style: TextStyle(
                                color: appState.isDarkMode
                                    ? Colors.white
                                    : const Color(0xffa80000),
                              ),
                            ),
                            trailing: Icon(
                              _customTileExpanded
                                  ? CupertinoIcons.up_arrow
                                  : CupertinoIcons.down_arrow,
                              color: appState.isDarkMode
                                  ? Colors.white
                                  : const Color(0xffa80000),
                            ),
                            children: <Widget>[
                              Container(height: 300, child: const CarouselSliderWidget()),
                            ],
                            onExpansionChanged: (bool expanded) {
                              setState(() => _customTileExpanded = expanded);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 130,
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
                    ],
                  ))));
    });
  }
}
