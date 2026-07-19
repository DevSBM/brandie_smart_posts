import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.borderRadius = 120,
    this.isDark = true,
    this.customAlpha,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final bool isDark;
  final int? customAlpha;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? Color.fromARGB(customAlpha ?? 50, 0, 0, 0)
            : Color.fromARGB(customAlpha ?? 50, 255, 255, 255),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
