import 'package:flutter/material.dart';

class TopNavigationLabel extends StatelessWidget {
  const TopNavigationLabel({
    super.key,
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: selected
            ? const Color.fromARGB(255, 114, 197, 159)
            : const Color.fromARGB(255, 85, 85, 85),
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
