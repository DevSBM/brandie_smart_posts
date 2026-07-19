import 'package:brandie_smart_posts/core/theme/app_theme.dart';
import 'package:brandie_smart_posts/features/smart_post/presentation/screens/smart_posts_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Brandie Smart Posts",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: SmartPostsScreen(),
    );
  }
}
