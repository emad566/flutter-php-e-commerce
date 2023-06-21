import 'package:flutter_e_commerce/core/functions/snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    snackBar('Error', 'Could not launch $url');
    throw 'Could not launch $url';
  }
}