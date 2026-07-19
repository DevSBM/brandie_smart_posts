import 'package:brandie_smart_posts/features/smart_post/data/models/smart_post.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/caption_card.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/product_card.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/quick_share_bar.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/recommended_song_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostContentPanel extends ConsumerWidget {
  const PostContentPanel({
    super.key,
    required this.post,
    required this.isActive,
  });

  final SmartPost post;
  final bool isActive;

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ProductCard(product: post.product, ref: ref),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RecommendedSongCard(song: post.song),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CaptionCard(
            caption: post.caption,
            referralCode: post.referralCode,
            referralLink: post.referralLink,
            productId: post.id.toString(),
          ),
        ),
        const SizedBox(height: 16),
        QuickShareBar(),
      ],
    );
  }
}
