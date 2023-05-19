// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Videoplayerview extends StatefulWidget {
  const Videoplayerview({
    Key? key,
  }) : super(key: key);

  @override
  State<Videoplayerview> createState() => _VideoplayerviewState();
}

class _VideoplayerviewState extends State<Videoplayerview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            // VideoPlayerView(url: 'url', dataSourceType: DataSourceType.asset),
            SizedBox(
              height: 24,
            ),
            VideoPlayerView(
                url:
                    'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                dataSourceType: DataSourceType.network),
            SizedBox(
              height: 24,
            ),
            VideoPlayerView(
                url:
                    'https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                dataSourceType: DataSourceType.network),
          ],
        ));
  }
}
//=============

class VideoPlayerView extends StatefulWidget {
  final String url;
  final DataSourceType dataSourceType;
  const VideoPlayerView({
    Key? key,
    required this.url,
    required this.dataSourceType,
  }) : super(key: key);

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController = VideoPlayerController.network(widget.url);
        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController, aspectRatio: 16 / 9);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.dataSourceType.name.toUpperCase(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController),
        )
      ],
    );
  }
}

//
