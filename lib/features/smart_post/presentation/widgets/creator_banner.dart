import 'package:brandie_smart_posts/core/constants/app_assets.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/color_container.dart';
import 'package:flutter/material.dart';

class CreatorBanner extends StatelessWidget {
  const CreatorBanner({
    super.key,
    required this.currentIndex,
    required this.totalPosts,
  });
  final int currentIndex;
  final int totalPosts;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(120),
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(AppAssets.profile),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReadyBadge(),
              SizedBox(height: 5),
              Text(
                'High-converting in Oriflame Community',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  shadows: [Shadow(blurRadius: 5, color: Colors.black54)],
                ),
              ),
            ],
          ),
        ),
        ColorContainer(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          child: Text(
            '${currentIndex + 1} of $totalPosts',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

class ReadyBadge extends StatelessWidget {
  const ReadyBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 235, 134, 141),
            Color.fromARGB(255, 183, 130, 208),
          ],
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: const Text(
        '✨ Ready to share',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      ),
    );
  }
}
