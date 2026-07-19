import 'package:brandie_smart_posts/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatelessWidget {
  const AnimatedProgressBar({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: progress.clamp(0, 1)),
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOutCubic,
      builder: (context, value, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 11,
            child: Stack(
              children: [
                const Positioned.fill(
                  child: ColoredBox(color: AppColors.progressTrack),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: value,
                    child: const SizedBox.expand(
                      child: ColoredBox(color: AppColors.primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
