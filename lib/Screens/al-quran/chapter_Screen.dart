import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kbm/Helper/App_notifier.dart';
import 'package:provider/provider.dart';

class AttsPage extends StatefulWidget {
  final List<Map<String, String>> items;
  final int index;

  AttsPage(this.index, this.items);

  @override
  _AttsPageState createState() => _AttsPageState(index, items);
}

class _AttsPageState extends State<AttsPage> {
  List<Map<String, String>> items;
  int index;
  double arabicFontSize = 25.0;
  double englishFontSize = 20.0;
  dynamic colors = [Colors.black, Colors.white];
  final assetsAudioPlayer = AssetsAudioPlayer();
  _AttsPageState(this.index, this.items);

  String formatPosition(Duration d) =>
      d.toString().split('.').first.padLeft(8, "0");

  void openAudio(String audioUrl) async {
    print(audioUrl);
    try {
      await assetsAudioPlayer.open(
        Audio.network(audioUrl),
      );
    } catch (t) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) => AlertDialog(
            content: Text("Unable to play audio"),
            actions: <Widget>[
              MaterialButton(
                child: Text("Close"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ));
      print(t.toString());
    }
  }

  Widget audioPlayerWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        PlayerBuilder.current(
          player: assetsAudioPlayer,
          builder: (context, current) {
            return current != null
                ? PlayerBuilder.currentPosition(
                player: assetsAudioPlayer,
                builder: (context, position) {
                  Duration? maxDuration =
                      assetsAudioPlayer.current.value?.audio.duration;
                  return Column(
                    children: <Widget>[
                      Slider(
                        min: 0.0,
                        max: maxDuration!.inSeconds.toDouble(),
                        value: position.inSeconds.toDouble(),
                        onChanged: (value) {
                          assetsAudioPlayer
                              .seek(Duration(seconds: value.toInt()));
                        },
                        activeColor: Theme.of(context).primaryColor,
                        inactiveColor:
                        Theme.of(context).primaryColor.withOpacity(0.3),
                      ),
                      Text(
                          "${formatPosition(position)}/${formatPosition(maxDuration)}"),
                    ],
                  );
                })
                : Text(
              "Click on play button to start the audio. The audio might take some time to load depending on the speed of your internet connection",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).devicePixelRatio * 8),
            );
          },
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MaterialButton(
              shape: StadiumBorder(),
              color: Theme.of(context).primaryColor,
              child: PlayerBuilder.isPlaying(
                  player: assetsAudioPlayer,
                  builder: (context, isPlaying) {
                    return isPlaying
                        ? Icon(
                      Icons.pause,
                      color: Colors.white,
                    )
                        : Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    );
                  }),
              onPressed: () {
                if (assetsAudioPlayer.current.value == null) {
                  openAudio(items[index]['audio_url']!);
                } else {
                  assetsAudioPlayer.playOrPause();
                }
                setState(() {});
              },
            ),
            MaterialButton(
              shape: StadiumBorder(),
              color: Theme.of(context).primaryColor,
              child: Icon(
                Icons.stop,
                color: Colors.white,
              ),
              onPressed: () {
                assetsAudioPlayer.stop();
              },
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
      ],
    );
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Consumer<AppStateNotifier>(builder: (context, appState, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
              onPressed: () => items[index].containsKey("audio_url")
                  ? showModalBottomSheet(
                  context: context, builder: (context) => audioPlayerWidget())
                  : showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text("No Audio available"),
                    actions: <Widget>[
                      MaterialButton(
                        child: Text("Close"),
                        textColor: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                  )),
              child: Icon(Icons.play_circle_outline,color: Colors.white,),
            ),
            // backgroundColor: colors[1],
            appBar: AppBar(
              backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
              // surfaceTintColor: Colors.white,
              actions: [
            IconButton(
            icon: Icon(Icons.zoom_in),
            color: Colors.white,
            onPressed: () {
              setState(() {
                arabicFontSize += 1;
                englishFontSize += 1;
              });
            },
          ),
            IconButton(
              icon: Icon(Icons.zoom_out),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  arabicFontSize -= 1;
                  englishFontSize -= 1;
                });
              },
            ),
                FlutterSwitch(
                  width: 45.0,
                  height: 25.0,
                  toggleSize: 20.0,
                  value: Provider.of<AppStateNotifier>(context).isDarkMode,
                  borderRadius: 45.0,
                  padding: 1.0,
                  activeToggleColor: Color(0xFF6E40C9),
                  inactiveToggleColor: Color(0xFF2F363D),
                  activeSwitchBorder: Border.all(
                    color: Colors.black38,
                    width: 1.0,
                  ),
                  inactiveSwitchBorder: Border.all(
                    color: Color(0xFFD1D5DA),
                    width: 1.0,
                  ),
                  activeColor: Colors.white24,
                  inactiveColor: Colors.white,
                  activeIcon: Icon(
                    Icons.nightlight_round,
                    color: Color(0xFFF8E3A1),
                  ),
                  inactiveIcon: Icon(
                    Icons.wb_sunny,
                    color: Color(0xFFFFDF5D),
                  ),
                  onToggle: (val) {
                    Provider.of<AppStateNotifier>(context, listen: false)
                        .updateTheme(val);
                  },
                ),
                const SizedBox(
                  width: 7,
                ),
              ],
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(CupertinoIcons.back)),

              title: Text(
                items[index]['title']!,
                style: const TextStyle(fontSize: 16),
              ),
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text("Arabic",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                        )),
                  ),
                  Tab(
                    child: Text("Translation",
                        style: TextStyle(fontSize: screenWidth * 0.03)),
                  ),
                  Tab(
                    child: Text("Translit...",
                        style: TextStyle(fontSize: screenWidth * 0.03)),
                  ),
                ],
              ),


            ),
            body: Container(
              child: SafeArea(
                child: TabBarView(
                  children: [
                    Scrollbar(
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 14.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      color: appState.isDarkMode ? Colors.white : const Color(0xffa80000),
                                      fontSize: arabicFontSize,
                                      fontFamily: 'Alqalam',
                                      decoration: TextDecoration.underline,
                                      height: 2.0,
                                      wordSpacing: 1.2),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  '${items[index]['arabic']}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      color: appState.isDarkMode ? Colors.white : Color(0xffa80000),
                                      fontSize: arabicFontSize,
                                      fontFamily: 'Alqalam',
                                      decoration: TextDecoration.underline,
                                      height: 2.0,
                                      wordSpacing: 1.2),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          )),
                    ),
                    Scrollbar(
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Container(padding: EdgeInsets.all(5),
                            child: Text(
                              '${items[index]['translation']}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color:appState.isDarkMode ? Colors.white : Color(0xffa80000),
                                  fontSize: englishFontSize,
                                  height: 1.5),
                            ),
                          )),
                    ),
                    Scrollbar(
                      child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Container(padding: EdgeInsets.all(5),
                            child: Text(
                              '${items[index]['transliteration']}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: appState.isDarkMode ? Colors.white : Color(0xffa80000),
                                  fontSize: englishFontSize,
                                  height: 1.5),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
