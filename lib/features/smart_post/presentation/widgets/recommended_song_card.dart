import 'package:brandie_smart_posts/core/constants/app_assets.dart';
import 'package:brandie_smart_posts/features/smart_post/data/models/recommended_song.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/color_container.dart';
import 'package:flutter/material.dart';

class RecommendedSongCard extends StatelessWidget {
  const RecommendedSongCard({super.key, required this.song});

  final RecommendedSong song;
  @override
  Widget build(BuildContext context) {
    return ColorContainer(
      borderRadius: 8,
      child: Row(
        children: [
          SizedBox(
            width: 23,
            height: 23,
            child: Image.asset(AppAssets.musicIconSmall, fit: BoxFit.contain),
          ),
          SizedBox(width: 7),
          Text(
            "RECOMMENDED:",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
          SizedBox(width: 8),
          Text(
            "${song.title} ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("by ${song.artist}", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
