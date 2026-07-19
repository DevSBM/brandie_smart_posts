import 'package:brandie_smart_posts/features/smart_post/controllers/states/share_preparation_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SharePreparationStep {
  generatingSalesLink,
  copyingCaption,
  savingContent,
  preparingSocialMedia,
}

String getMessageForStep(SharePreparationStep step) {
  return switch (step) {
    SharePreparationStep.generatingSalesLink => 'Generating your sales link...',
    SharePreparationStep.copyingCaption => 'Copying the caption to clipboard',
    SharePreparationStep.savingContent => 'Saving the content to your profile',
    SharePreparationStep.preparingSocialMedia =>
      'Preparing the content for social media',
  };
}

double getTargetProgressForStep(SharePreparationStep step) {
  return switch (step) {
    SharePreparationStep.generatingSalesLink => 0.25,
    SharePreparationStep.copyingCaption => 0.50,
    SharePreparationStep.savingContent => 0.75,
    SharePreparationStep.preparingSocialMedia => 1.00,
  };
}

Duration eachStepDuration = Duration(milliseconds: 850);

final sharePreparationControllerProvider =
    NotifierProvider.autoDispose<
      SharePreparationController,
      SharePreparationState
    >(SharePreparationController.new);

class SharePreparationController extends Notifier<SharePreparationState> {
  @override
  SharePreparationState build() {
    return const SharePreparationState();
  }

  Future<bool> start() async {
    state = const SharePreparationState(isVisible: true);

    try {
      for (final step in SharePreparationStep.values) {
        state = state.copyWith(
          currentStep: step,
          progress: getTargetProgressForStep(step),
          isCompleted: false,
          clearError: true,
        );

        await performStep(step);
      }

      // Keep the completed bar visible briefly
      await Future<void>.delayed(const Duration(milliseconds: 400));

      state = state.copyWith(progress: 1, isCompleted: true);

      await Future<void>.delayed(const Duration(milliseconds: 250));

      state = state.copyWith(isVisible: false);

      return true;
    } catch (error, stackTrace) {
      debugPrint('Share preparation failed: $error\n$stackTrace');

      return false;
    }
  }

  Future<void> performStep(SharePreparationStep step) async {
    await Future<void>.delayed(eachStepDuration);
  }

  void dismiss() {
    state = const SharePreparationState();
  }
}
