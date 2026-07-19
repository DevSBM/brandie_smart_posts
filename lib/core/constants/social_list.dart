import 'package:brandie_smart_posts/core/constants/app_assets.dart';

List<String> ALL_SOCIAL_ICONS = [
  AppAssets.instagram,
  AppAssets.instagramStory,
  AppAssets.facebook,
  AppAssets.facebookStory,
  AppAssets.messenger,
  AppAssets.tiktok,
  AppAssets.telegram,
  AppAssets.whatsapp,
  AppAssets.whatsappBusiness,
  AppAssets.mail,
  AppAssets.otherSocial,
];

class SocialModel {
  final String imageUrl, shareLink;
  final bool isStory;

  SocialModel({
    required this.imageUrl,
    required this.shareLink,
    required this.isStory,
  });
}

Set<String> SOCIAL_STORY_SET = {
  AppAssets.facebookStory,
  AppAssets.instagramStory,
};

List<SocialModel> SOCIAL_LIST = ALL_SOCIAL_ICONS.map((iconPath) {
  return SocialModel(
    imageUrl: iconPath,
    shareLink: "",
    isStory: SOCIAL_STORY_SET.contains(iconPath),
  );
}).toList();
