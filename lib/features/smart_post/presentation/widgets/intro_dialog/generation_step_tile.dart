import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/intro_dialog/generation_step_status.dart';
import 'package:flutter/material.dart';

class GenerationStepTile extends StatelessWidget {
  const GenerationStepTile({required this.label, required this.status});

  final String label;
  final GenerationStepStatus status;

  static const mintColor = Color(0xFF91DCBA);
  static const activeTextColor = Color(0xFF27282D);
  static const inactiveTextColor = Color(0xFF7D8491);
  static const inactiveCircleColor = Color(0xFFD1D5DD);

  @override
  Widget build(BuildContext context) {
    final isActive = status == GenerationStepStatus.active;

    final isCompleted = status == GenerationStepStatus.completed;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 36,
          height: 36,
          child: Center(
            // Simple Animation during widget incoming and outgoing
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              switchInCurve: Curves.easeOutBack,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                );
              },
              child: buildStatusIcon(),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: TextStyle(
              color: isActive || isCompleted
                  ? activeTextColor
                  : inactiveTextColor,
              fontSize: 22,
              height: 1.45,
              fontWeight: isActive || isCompleted
                  ? FontWeight.w700
                  : FontWeight.w400,
            ),
            child: Text(label),
          ),
        ),
      ],
    );
  }

  Widget buildStatusIcon() {
    return switch (status) {
      GenerationStepStatus.pending => Container(
        key: const ValueKey('pending'),
        width: 29,
        height: 29,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: inactiveCircleColor, width: 2.5),
        ),
      ),
      GenerationStepStatus.active => const SizedBox(
        key: ValueKey('active'),
        width: 29,
        height: 29,
        child: CircularProgressIndicator(strokeWidth: 2.7, color: mintColor),
      ),
      GenerationStepStatus.completed => Container(
        key: const ValueKey('completed'),
        width: 29,
        height: 29,
        decoration: const BoxDecoration(
          color: mintColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.check_rounded, color: Colors.white, size: 20),
      ),
    };
  }
}
