import 'dart:ui';

import 'package:brandie_smart_posts/features/smart_post/controllers/share_preparation_controller.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/share_dialog/share_loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SharePreparationOverlay extends ConsumerWidget {
  const SharePreparationOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sharePreparationControllerProvider);

    if (!state.isVisible) {
      return const SizedBox.shrink();
    }

    return Positioned.fill(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background blur.
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: const ColoredBox(color: Color.fromARGB(82, 0, 0, 0)),
            ),
          ),

          // Prevent the user from interacting with the screen while the loading operation is running
          const ModalBarrier(dismissible: false, color: Colors.transparent),

          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: ShareLoadingCard(state: state),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
