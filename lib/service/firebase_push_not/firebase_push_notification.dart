
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotification{
  final _firebaseMessage = FirebaseMessaging.instance;
  Future<void>handleBackroundMessage(RemoteMessage remoteMessage)async{
    print('Title ${remoteMessage.notification?.title}');
    print('Body ${remoteMessage.notification?.body}');
    print('Body ${remoteMessage.data}');
  }
  Future<void> initNotification()async{
    await _firebaseMessage.requestPermission();
    final fCMToken = await _firebaseMessage.getToken();
    print('Token $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackroundMessage);
  }
}