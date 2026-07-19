import 'package:brandie_smart_posts/features/smart_post/controllers/states/smart_post_state.dart';
import 'package:brandie_smart_posts/features/smart_post/data/models/smart_post_status.dart';
import 'package:brandie_smart_posts/features/smart_post/data/testData/smartPostTestData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final smartPostControllerProvider =
    NotifierProvider<SmartPostController, SmartPostState>(
      SmartPostController.new,
    );

class SmartPostController extends Notifier<SmartPostState> {
  static const int generationStepCount = 4;

  static const Duration _stepDuration = Duration(milliseconds: 700);

  @override
  SmartPostState build() {
    return const SmartPostState();
  }

  // Starts simulated Smart Post generation sequence.
  Future<void> loadPosts() async {
    final isAlreadyLoading = state.status == SmartPostStatus.generating;

    final hasAlreadyLoaded = state.status == SmartPostStatus.ready;

    if (isAlreadyLoading || hasAlreadyLoaded) {
      return;
    }

    state = const SmartPostState(status: SmartPostStatus.generating);

    try {
      for (
        var completedStep = 1;
        completedStep <= generationStepCount;
        completedStep++
      ) {
        await Future.delayed(_stepDuration);

        state = state.copyWith(completedSteps: completedStep);
      }

      await Future<void>.delayed(_stepDuration);

      state = state.copyWith(
        status: SmartPostStatus.ready,
        posts: SMART_POSTS,
        selectedIndex: 0,
        captionExpandedIds: {},
      );
    } catch (error, stackTrace) {
      debugPrint('Unable to load Smart Posts: $error\n$stackTrace');

      state = state.copyWith(status: SmartPostStatus.failure);
    }
  }

  Future<void> retry() {
    return loadPosts();
  }

  /// Updates selected post when PageView changes.
  void selectPost(int index) {
    if (index < 0 || index >= state.posts.length) {
      return;
    }

    if (index == state.selectedIndex) {
      return;
    }

    state = state.copyWith(selectedIndex: index);
  }

  // Expands or collapses selected post caption.
  void toggleCaption() {
    if (!state.hasPosts ||
        (state.selectedIndex < 0 ||
            state.selectedIndex >= state.posts.length)) {
      return;
    }

    Set<String> newSelectedIdxs = Set.from(state.captionExpandedIds);

    if (!newSelectedIdxs.add(state.posts[state.selectedIndex].id)) {
      newSelectedIdxs.remove(state.posts[state.selectedIndex].id);
    }

    state = state.copyWith(captionExpandedIds: newSelectedIdxs);
  }

  // Simulates generating the referral or sales link.
  Future<void> generateSalesLink() async {
    if (state.isGeneratingLink || !state.hasPosts) {
      return;
    }

    state = state.copyWith(isGeneratingLink: true);

    try {
      await Future<void>.delayed(const Duration(milliseconds: 1400));

      state = state.copyWith(isGeneratingLink: false);
    } catch (error, stackTrace) {
      debugPrint(
        'Unable to generate sales link: '
        '$error\n$stackTrace',
      );

      state = state.copyWith(isGeneratingLink: false);
    }
  }

  void addToShownProduct(String productId) {
    state = state.copyWith(
      shownProductIds: Set.from({...state.shownProductIds, productId}),
    );
  }
}
