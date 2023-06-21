
import 'package:firebase_messaging/firebase_messaging.dart';

void getMobileToken() async{
  // ignore: avoid_print
  FirebaseMessaging.instance.getToken().then((value) => print(value));
}