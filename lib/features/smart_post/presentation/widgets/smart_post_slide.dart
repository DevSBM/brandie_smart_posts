import 'package:brandie_smart_posts/features/smart_post/controllers/smart_post_controller.dart';
import 'package:brandie_smart_posts/features/smart_post/data/models/smart_post.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/creator_banner.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/post_content_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmartPostSlide extends ConsumerWidget {
  const SmartPostSlide({super.key, required this.post, required this.curIdx});

  final SmartPost post;
  final int curIdx;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(smartPostControllerProvider);

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            post.imagePath,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.30, 0.60, 1],
                colors: [
                  Color.fromARGB(60, 0, 0, 0),
                  Color.fromARGB(120, 0, 0, 0),
                  Color.fromARGB(200, 0, 0, 0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 18,
          left: 16,
          right: 16,
          child: CreatorBanner(
            currentIndex: curIdx,
            totalPosts: state.posts.length,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 114,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: PostContentPanel(
              post: post,
              isActive: curIdx == state.selectedIndex,
            ),
          ),
        ),
      ],
    );
  }
}
