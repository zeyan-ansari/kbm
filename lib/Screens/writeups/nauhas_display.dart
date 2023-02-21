import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../Helper/App_notifier.dart';
import 'data/writeup_data.dart';

//import 'package:stars14/screens/nauhasHome.dart';
//import 'package:audioplayers/audio_cache.dart';

class NauhaDisplay extends StatefulWidget {
  final int outerindex, innerindex;
  NauhaDisplay(this.outerindex, this.innerindex);
  @override
  _NauhaDisplayState createState() => _NauhaDisplayState();
}

class _NauhaDisplayState extends State<NauhaDisplay> {
  double fontSize = 23.0;
  dynamic colors = [Colors.black, Colors.white];
  final assetsAudioPlayer = AssetsAudioPlayer();

  String formatPosition(Duration d) =>
      d.toString().split('.').first.padLeft(8, "0");

  void increaseFontSize() {
    if (fontSize < 60.0) {
      setState(() {
        fontSize += 1;
      });
    }
  }

  void decreaseFontSize() {
    if (fontSize > 10.0) {
      setState(() {
        fontSize -= 1;
      });
    }
  }

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
                        max: double.parse('${maxDuration?.inSeconds.toDouble()}'),
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
                          "${formatPosition(position)}/${formatPosition(maxDuration!)}"),
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
                  openAudio(
                      nauhas[widget.outerindex]['audios'][widget.innerindex]);
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
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.play_circle_outline,color: Colors.white),
            backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
            onPressed: () => nauhas[widget.outerindex].containsKey("audios") &&
                (widget.innerindex < nauhas[widget.outerindex]['audios'].length)
                ? showModalBottomSheet(
                context: context, builder: (context) => audioPlayerWidget())
                : showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text("Unfortunately, audio is not available."),
                  actions: <Widget>[
                    MaterialButton(
                      child: Text("Close"),
                      textColor: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                )),
          ),
          appBar:
          AppBar(
            backgroundColor: appState.isDarkMode ? Colors.black : Color(0xffa80000),
            // surfaceTintColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.share,
                ),
                color: Colors.white,
                onPressed: () {
                  Share.share(
                      nauhas[widget.outerindex]['nauhabody'][widget.innerindex]);
                },
              ),
              IconButton(
                icon: Icon(Icons.zoom_in),
                onPressed: increaseFontSize,
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.zoom_out),
                onPressed: decreaseFontSize,
                color: Colors.white,
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
                nauhas[widget.outerindex]['nauhatitles'][widget.innerindex],
              style: const TextStyle(fontSize: 16),
            ),



          ),

          body: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SingleChildScrollView(
              child: Text(
                nauhas[widget.outerindex]['nauhabody'][widget.innerindex],
                style: TextStyle(
                  color: appState.isDarkMode ? Colors.white : const Color(0xffa80000),
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
//String playAudio = "Play";
/*
  void playNauha() {
    final player = AudioCache();
    player.play("audio/aadil00.mp3");
  }
  */
}
