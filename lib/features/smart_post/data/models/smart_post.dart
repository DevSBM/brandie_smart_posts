import 'package:brandie_smart_posts/features/smart_post/data/models/product.dart';
import 'package:brandie_smart_posts/features/smart_post/data/models/recommended_song.dart';
import 'package:flutter/material.dart';

@immutable
class SmartPost {
  const SmartPost({
    required this.id,
    required this.imagePath,
    required this.caption,
    required this.song,
    required this.product,
    required this.referralCode,
    required this.referralLink,
  });

  final String id;
  final String imagePath;
  final String caption;
  final String referralLink;
  final String referralCode;
  final RecommendedSong song;
  final Product product;
}
