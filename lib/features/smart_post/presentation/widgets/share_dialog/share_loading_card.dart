import 'package:brandie_smart_posts/core/constants/app_assets.dart';
import 'package:brandie_smart_posts/features/smart_post/controllers/share_preparation_controller.dart';
import 'package:brandie_smart_posts/features/smart_post/controllers/states/share_preparation_state.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/share_dialog/animated_progress_bar.dart';
import 'package:flutter/material.dart';

class ShareLoadingCard extends StatelessWidget {
  const ShareLoadingCard({required this.state});

  final SharePreparationState state;

  static const mint = Color.fromARGB(255, 150, 221, 190);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32, 42, 32, 38),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            child: Image.asset(AppAssets.appIcon),
          ),
          const SizedBox(height: 22),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: Text(
              getMessageForStep(state.currentStep),
              key: ValueKey(state.currentStep),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 180, 180, 180),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 20),

          AnimatedProgressBar(progress: state.progress),
        ],
      ),
    );
  }
}
