import 'package:brandie_smart_posts/core/constants/social_list.dart';
import 'package:brandie_smart_posts/features/smart_post/controllers/share_preparation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuickShareBar extends ConsumerWidget {
  const QuickShareBar({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        SizedBox(width: 10),
        Text(
          "Quick share to:",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: 12),

            child: Row(
              spacing: 10,
              children: SOCIAL_LIST.map((social) {
                return GestureDetector(
                  onTap: () {
                    ref
                        .read(sharePreparationControllerProvider.notifier)
                        .start();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(199, 91, 91, 91),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(social.imageUrl),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
