import 'package:brandie_smart_posts/core/constants/app_assets.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/header_action_btn.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/widgets/top_navigation_label.dart';
import 'package:flutter/material.dart';

class SmartPostHeader extends StatelessWidget {
  const SmartPostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 24,
          right: 24,
          top: 12,
          bottom: 16,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.scale(
                  scale: 1.1,
                  child: HeaderActionBtn(
                    actionImagePath: AppAssets.assistantIcon,
                    actionText: "Your Assistant",
                    onClick: () {
                      debugPrint("Assistant Button");
                    },
                  ),
                ),

                Transform.scale(
                  scale: 4.2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: HeaderActionBtn(
                      actionImagePath: AppAssets.companyLogo,
                      onClick: () {},
                    ),
                  ),
                ),

                Transform.scale(
                  scale: 1.1,
                  child: HeaderActionBtn(
                    actionImagePath: AppAssets.cameraIcon,
                    actionText: "Camera",
                    onClick: () {
                      debugPrint("Camera Button");
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TopNavigationLabel(label: "Smart Post", selected: true),
                TopNavigationLabel(label: "Library"),
                TopNavigationLabel(label: "Communities"),
                TopNavigationLabel(label: "Share&Win"),
              ],
            ),
            SizedBox(height: 1),
          ],
        ),
      ),
    );
  }
}
