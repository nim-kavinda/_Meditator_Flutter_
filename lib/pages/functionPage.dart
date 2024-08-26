import 'package:flutter/material.dart';
import 'package:meditor/models/function_data_model.dart';
import 'package:meditor/utils/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Functionpage extends StatefulWidget {
  final FunctionData functionData;
  const Functionpage({
    super.key,
    required this.functionData,
  });

  @override
  State<Functionpage> createState() => _FunctionpageState();
}

class _FunctionpageState extends State<Functionpage> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    //get video id from url
    final videoId = YoutubePlayer.convertUrlToId(widget.functionData.url) ?? "";

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.functionData.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_controller.initialVideoId.isNotEmpty)
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: YoutubePlayer(controller: _controller),
                    ),
                  )
                else
                  const Text("No video available"),
                Text(
                  'Duration: ${widget.functionData.duration} min',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryGrey,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  'Category: ${widget.functionData.category}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryGreen,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.functionData.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryDarkBlue,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
