import 'package:flutter_e_commerce/core/functions/refresh_page_notification.dart';
import 'package:flutter_e_commerce/core/functions/snack_bar.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

displayInAppNotification({
  required String title,
  required String body,
  required Map<String, dynamic> data}){
  FlutterRingtonePlayer.playNotification();
  snackBar(title, body);
  refreshPageNotification(data);
}