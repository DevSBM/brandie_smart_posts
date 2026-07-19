import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String link) async {
  return;
  final Uri url = Uri.parse(link);

  await launchUrl(url, mode: LaunchMode.externalApplication);
}
