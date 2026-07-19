import 'package:brandie_smart_posts/features/smart_post/controllers/share_preparation_controller.dart';

class SharePreparationState {
  const SharePreparationState({
    this.isVisible = false,
    this.currentStep = SharePreparationStep.generatingSalesLink,
    this.progress = 0,
    this.isCompleted = false,
  });

  final bool isVisible;
  final SharePreparationStep currentStep;
  final double progress;
  final bool isCompleted;

  SharePreparationState copyWith({
    bool? isVisible,
    SharePreparationStep? currentStep,
    double? progress,
    bool? isCompleted,
    String? errorMessage,
    bool clearError = false,
  }) {
    return SharePreparationState(
      isVisible: isVisible ?? this.isVisible,
      currentStep: currentStep ?? this.currentStep,
      progress: progress ?? this.progress,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
