import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../Helper/App_notifier.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../models/channel_model.dart';
import '../../models/video_model.dart';
import '../../services/api_service.dart';
import 'video_screen.dart';

class KBMYoutubeChannel extends StatefulWidget {
  @override
  _KBMYoutubeChannelState createState() => _KBMYoutubeChannelState();
}

class _KBMYoutubeChannelState extends State<KBMYoutubeChannel> {
  Channel? _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCvCxOCEs_bCaKwEh3Km_CrQ');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return Container(
          decoration: ShapeDecoration(
              color: appState.isDarkMode?Color(0xff121212):Colors.black.withOpacity(0.05),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              )
          ),
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(20.0),
          height: 100.0,

          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35.0,
                backgroundImage: NetworkImage('${_channel?.profilePictureUrl}'),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${_channel?.title}',
                      style: TextStyle(
                        color: appState.isDarkMode?Colors.white:Color(0xffa80000),                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${_channel?.subscriberCount} subscribers',
                      style: TextStyle(
                        color: appState.isDarkMode?Colors.white:Color(0xffa80000),                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }

  _buildVideo(Video video) {
    return  Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VideoScreen(id: video.id,name:video.title),
            ),
          ),
          child: Container(
            decoration: ShapeDecoration(
                color: appState.isDarkMode?Color(0xff121212):Colors.black.withOpacity(0.05),
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                )
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            padding: EdgeInsets.all(10.0),
            height: 140.0,

            child: Row(
              children: <Widget>[
                Image(
                  width: 150.0,
                  image: NetworkImage('${video.thumbnailUrl}'),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    '${video.title}',
                    style: TextStyle(
                      color: appState.isDarkMode?Colors.white:Color(0xffa80000),                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: '${_channel?.uploadPlaylistId}');
    List<Video>? allVideos = _channel?.videos?..addAll(moreVideos);
    setState(() {
      _channel?.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
        builder: (context, appState, child) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: CustomAppBar(
                Name: 'Youtube',
                isCompass: false,
                isDark: appState.isDarkMode,
              )),
          body: _channel != null
              ? NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollDetails) {
                    if (!_isLoading &&
                        _channel?.videos?.length != int.parse('${_channel?.videoCount}') &&
                        scrollDetails.metrics.pixels ==
                            scrollDetails.metrics.maxScrollExtent) {
                      _loadMoreVideos();
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: 1 + _channel!.videos!.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return _buildProfileInfo();
                      }
                      Video video = _channel!.videos![index - 1];
                      return _buildVideo(video);
                    },
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xffa80000), // Red
                    ),
                  ),
                ),
        );
      }
    );
  }
}
