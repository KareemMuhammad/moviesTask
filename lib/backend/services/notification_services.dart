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
          print('User granted permission');
        } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
          print('User granted provisional permission');
        } else {
          print('User declined or has not accepted permission');
        }
      }
          final String? token = await FirebaseMessaging.instance.getToken();


      messaging!.getInitialMessage().then((message) {
        if(message != null) {

        }
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('On message listen!');
        RemoteNotification notification = message.notification!;

      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('A new onMessageOpenedApp event was published!');

      });
  }

}