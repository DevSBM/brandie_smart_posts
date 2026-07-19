import 'package:brandie_smart_posts/features/smart_post/controllers/smart_post_controller.dart';
import 'package:brandie_smart_posts/features/smart_post/data/models/smart_post_status.dart';
import 'package:brandie_smart_posts/features/smart_post/data/testData/smartPostTestData.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/intro_dialog/generation_dialog.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/sales_link_loading_overlay.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/share_dialog/share_preparation_overlay.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/smart_post_bottom_navigation.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/smart_post_header.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/smart_post_slide.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/vertical_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmartPostsScreen extends ConsumerStatefulWidget {
  const SmartPostsScreen({super.key});

  @override
  ConsumerState<SmartPostsScreen> createState() => _SmartPostsScreenState();
}

class _SmartPostsScreenState extends ConsumerState<SmartPostsScreen> {
  late final PageController pageController;
  @override
  void initState() {
    super.initState();

    pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(smartPostControllerProvider.notifier).loadPosts();
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(smartPostControllerProvider);
    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                const SmartPostHeader(),
                Expanded(
                  child: Stack(
                    children: [
                      if (state.status == SmartPostStatus.ready)
                        PageView.builder(
                          controller: pageController,
                          itemCount: SMART_POSTS.length,
                          onPageChanged: (value) {
                            ref
                                .read(smartPostControllerProvider.notifier)
                                .selectPost(value);
                          },
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return SmartPostSlide(
                              post: SMART_POSTS[index],
                              curIdx: index,
                            );
                          },
                        ),

                      if (state.status == SmartPostStatus.generating)
                        GenerationDialog(completedSteps: state.completedSteps),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SmartPostBottomNavigation(),
                      ),

                      if (state.status == SmartPostStatus.ready)
                        Positioned(
                          right: 16,
                          top: MediaQuery.of(context).size.height * 0.2,
                          child: VerticalPageIndicator(
                            currentIndex: state.selectedIndex,
                            totalCount: state.posts.length,
                          ),
                        ),

                      if (state.isGeneratingLink)
                        const Positioned.fill(child: SalesLinkLoadingOverlay()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SharePreparationOverlay(),
        ],
      ),
    );
  }
}
