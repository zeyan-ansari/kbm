import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';


class VideoScreen extends StatefulWidget {

  final String? id;
  final String? name;

  VideoScreen({this.id,this.name});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  YoutubePlayerController? _controller;

  @override
  void initState() {
    super.initState(); SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    _controller = YoutubePlayerController(
      initialVideoId: '${widget.id}',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(builder: (context, appState, child) {
        return Scaffold(
          appBar:PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppBar(
                Name: '${widget.name}',
                isCompass: true,
                isDark: appState.isDarkMode,
              )),
          body: YoutubePlayer(
            controller: _controller!,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready.');
            },
          ),
        );
      }
    );
  }
}