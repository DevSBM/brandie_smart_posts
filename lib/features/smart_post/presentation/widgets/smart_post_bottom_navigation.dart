import 'package:flutter/material.dart';

class SmartPostBottomNavigation extends StatelessWidget {
  const SmartPostBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 28),
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationIcon(imageLink: "assets/icons/rocket_icon.png"),
            NavigationIcon(imageLink: "assets/icons/search_icon.png"),
            NavigationIcon(imageLink: "assets/icons/home_icon.png"),
            NavigationIcon(imageLink: "assets/icons/message_icon.png"),
            NavigationIcon(imageLink: "assets/icons/profile_icon.png"),
          ],
        ),
      ),
    );
  }
}

class NavigationIcon extends StatelessWidget {
  const NavigationIcon({required this.imageLink});

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      child: Image.asset(imageLink, fit: BoxFit.contain),
    );
  }
}
