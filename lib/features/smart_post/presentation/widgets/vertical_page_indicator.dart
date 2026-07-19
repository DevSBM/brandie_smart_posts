import 'package:flutter/material.dart';

class VerticalPageIndicator extends StatelessWidget {
  const VerticalPageIndicator({
    super.key,
    required this.currentIndex,
    required this.totalCount,
  });

  final int currentIndex;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: List.generate(
          totalCount,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 12,
            height: 12,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentIndex
                  ? const Color(0xFF78D4A8)
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
