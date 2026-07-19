import 'package:brandie_smart_posts/core/constants/app_assets.dart';
import 'package:brandie_smart_posts/features/smart_post/controllers/smart_post_controller.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/screens/edit_caption_screen.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/color_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CaptionCard extends ConsumerStatefulWidget {
  CaptionCard({
    super.key,
    required this.productId,
    required this.referralCode,
    required this.referralLink,
    required this.caption,
  });
  final String referralCode, referralLink, caption, productId;

  @override
  ConsumerState<CaptionCard> createState() => _CaptionCardState();
}

class _CaptionCardState extends ConsumerState<CaptionCard> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(smartPostControllerProvider);
    return ColorContainer(
      borderRadius: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 6,
                children: [
                  Transform.scale(
                    scale: 1.2,
                    child: Image.asset(AppAssets.aiIconSmall),
                  ),
                  Text(
                    "CAPTION SUGGESTION",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return EditCaptionScreen(
                          initialCaption: widget.caption,
                          autofocus: false,
                        );
                      },
                    ),
                  );
                },
                child: Row(
                  spacing: 6,
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Image.asset(AppAssets.editIconSmall),
                    ),
                    Text(
                      "Edit Caption",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              ref.read(smartPostControllerProvider.notifier).toggleCaption();
            },
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: state.captionExpandedIds.contains(widget.productId)
                        ? "${widget.caption}..."
                        : "${widget.caption.substring(0, 96)}...",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white.withAlpha(220),
                    ),
                  ),
                  TextSpan(
                    text: state.captionExpandedIds.contains(widget.productId)
                        ? "see less"
                        : "see more",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white.withAlpha(220),
                      decorationThickness: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 15),

          Text(
            "Use my referral code: ${widget.referralCode}",
            style: TextStyle(
              color: Colors.white.withAlpha(150),
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),
          ),

          Text(
            "Use my referral link: ${widget.referralLink}",
            style: TextStyle(
              color: Colors.white.withAlpha(150),
              fontStyle: FontStyle.italic,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
