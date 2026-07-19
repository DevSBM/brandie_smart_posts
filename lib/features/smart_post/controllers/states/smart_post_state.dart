import 'package:brandie_smart_posts/features/smart_post/data/models/smart_post.dart';
import 'package:brandie_smart_posts/features/smart_post/data/models/smart_post_status.dart';

class SmartPostState {
  const SmartPostState({
    this.status = SmartPostStatus.initial,
    this.posts = const [],
    this.selectedIndex = 0,
    this.completedSteps = 0,
    this.captionExpandedIds = const {},
    this.shownProductIds = const {},
    this.isGeneratingLink = false,
  });

  // Current state of screen
  final SmartPostStatus status;

  // All Smart Posts Inside Page view
  final List<SmartPost> posts;

  // Currently selected post in the Page View
  final int selectedIndex;

  // Number of completed generation steps
  final int completedSteps;

  final Set<String> captionExpandedIds;
  final Set<String> shownProductIds;

  // Controls the sales link loading overlay.
  final bool isGeneratingLink;

  bool get hasPosts => posts.isNotEmpty;

  bool get hasCompletedGeneration => completedSteps >= 4;

  SmartPost? get selectedPost {
    if (posts.isEmpty || selectedIndex < 0 || selectedIndex >= posts.length) {
      return null;
    }

    return posts[selectedIndex];
  }

  SmartPostState copyWith({
    SmartPostStatus? status,
    List<SmartPost>? posts,
    int? selectedIndex,
    int? completedSteps,
    Set<String>? captionExpandedIds,
    Set<String>? shownProductIds,
    bool? isGeneratingLink,
  }) {
    return SmartPostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      completedSteps: completedSteps ?? this.completedSteps,
      captionExpandedIds: captionExpandedIds ?? this.captionExpandedIds,
      isGeneratingLink: isGeneratingLink ?? this.isGeneratingLink,
      shownProductIds: shownProductIds ?? this.shownProductIds,
    );
  }
}
