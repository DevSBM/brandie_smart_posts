import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/intro_dialog/generation_step_status.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/intro_dialog/generation_step_tile.dart';
import 'package:flutter/material.dart';

class GenerationDialog extends StatelessWidget {
  const GenerationDialog({required this.completedSteps, super.key});

  final int completedSteps;

  static const List<String> steps = [
    'Preparing popular\ncontent for you',
    'Crafting a caption to\nboost engagement',
    'Adding your personal\nreferral link and code',
    'Finding trending songs\non other social media',
  ];

  bool get allStepsCompleted => completedSteps >= steps.length;
  final topSpacing = 60.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, topSpacing, 32, 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Column(
              children: [
                const Text(
                  'Building personalised\nSmart Posts for you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 40, 40, 40),
                    fontSize: 30,
                    height: 1.3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 54),

                ...List.generate(steps.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: GenerationStepTile(
                      label: steps[index],
                      status: getStatusFor(index),
                    ),
                  );
                }),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  child: allStepsCompleted
                      ? const Text(
                          'All set! Get ready to share...',
                          key: ValueKey('all-set'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF666A74),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : const SizedBox(key: ValueKey('not-completed')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GenerationStepStatus getStatusFor(int index) {
    if (index < completedSteps) {
      return GenerationStepStatus.completed;
    }

    if (index == completedSteps && completedSteps < steps.length) {
      return GenerationStepStatus.active;
    }

    return GenerationStepStatus.pending;
  }
}
