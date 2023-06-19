
import 'package:firebase_messaging/firebase_messaging.dart';

void getMobileToken() async{
  FirebaseMessaging.instance.getToken().then((value) => print(value));
}