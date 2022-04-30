import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationServices{
  final FirebaseMessaging? messaging;

  const PushNotificationServices({ this.messaging,});

  Future initiate() async{
      if(Platform.isIOS){
        NotificationSettings settings = await messaging!.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );

        if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
        } else {
        }
      }
          final String? token = await FirebaseMessaging.instance.getToken();


      messaging!.getInitialMessage().then((message) {
        if(message != null) {

        }
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification notification = message.notification!;

      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {

      });
  }

}