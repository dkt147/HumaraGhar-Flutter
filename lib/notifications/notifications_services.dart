
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{


  FirebaseMessaging messaging = FirebaseMessaging.instance;

final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

 void initLocalNotification(BuildContext context , RemoteMessage message)async{
         var androidInitialization = AndroidInitializationSettings('mipmap/ic_launcher');
      var iosInitialization = DarwinInitializationSettings();

      var initializationSettings = InitializationSettings(
        android: androidInitialization,
        iOS: iosInitialization
      );

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (payload){

        }
        );
 }
 
  void requestNotificationPermission()async{
    NotificationSettings settings = await messaging.requestPermission(
      alert :true, // notification can be displayed
      announcement: true, 
      badge: true, // notification app icon
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );
        // for android
     if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print('User granted permission');
     }
        // for ios
     else if(settings.authorizationStatus == AuthorizationStatus.provisional){
          print('User granted provision permission');
     }else{
      print('User DENIED permission');
     }
  }


       // tokens

  // get token for send notification on particular device
  Future<String> getDeviceToken()async{
   String? token = await messaging.getToken();
  return token!;
 }

   void isTokenRefresh(){
    messaging.onTokenRefresh.listen((event) { 
      event.toString();
    });
 }

 // When app is active

 void firebaseInit(BuildContext context){

  FirebaseMessaging.onMessage.listen((message) {
    if(kDebugMode){
      print(message.notification!.title.toString());
      print(message.notification!.body.toString());
    }
    if(Platform.isAndroid){
      initLocalNotification(context, message);
      showNotification(message);
    }
   });

 }

    // showing notification through local plug in
 Future<void> showNotification(RemoteMessage message)async{

    AndroidNotificationChannel channel =AndroidNotificationChannel(
          //          id                       ,     name
     Random.secure().nextInt(10000).toString() , 'High Importance Notification' ,
      importance: Importance.max
      );

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription: 'Your Channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker'
      );

      DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
        presentSound: true,
        presentBadge: true,
        presentAlert: true

      );

      NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails
      );

  Future.delayed(Duration.zero , (){
    _flutterLocalNotificationsPlugin.show(
    1, 
    message.notification!.title.toString(), 
    message.notification!.body.toString(), 
    notificationDetails);
    });
  } 
 }

