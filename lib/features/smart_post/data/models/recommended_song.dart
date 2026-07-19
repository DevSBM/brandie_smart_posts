import 'package:flutter/material.dart';

@immutable
class RecommendedSong {
  const RecommendedSong({required this.title, required this.artist});

  final String title;
  final String artist;
}
