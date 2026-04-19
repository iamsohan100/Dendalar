// ignore_for_file: use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

void launchWebUrl(BuildContext context, String link) async {
  // mainLoading(context);
  Uri url = Uri.parse(link);
  if (!await canLaunchUrl(url)) {
    await launchUrl(url);
    // Navigator.pop(context);
  } else {
    await launchUrl(url);
    // toastMessage(title: 'Failed', message: "Unable to find the link.");
    // Navigator.pop(context);
  }
}
