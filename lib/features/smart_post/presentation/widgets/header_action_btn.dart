import 'package:flutter/material.dart';

class HeaderActionBtn extends StatelessWidget {
  HeaderActionBtn({
    super.key,
    required this.actionImagePath,
    required this.onClick,
    this.actionText,
  });

  String actionImagePath;
  void Function() onClick;
  String? actionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onClick,
          child: Container(
            width: 40,
            height: 40,
            child: Image.asset(actionImagePath),
          ),
        ),
        if (actionText != null)
          Text(actionText!, style: TextStyle(color: Colors.grey, fontSize: 11)),
      ],
    );
  }
}
