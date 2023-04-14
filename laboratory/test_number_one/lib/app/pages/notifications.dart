import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:go_router/go_router.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest_all.dart' as tz;

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  // NotificationService service = NotificationService();
  bool valor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            // valor = !valor;
            // if (valor) {
            //   service.showNotification(
            //       CustomNotifications(1, "teste", "Acesse o App", '/zoom'));
            // }
          },
          child: const Text("Notification"),
        ),
      ),
    );
  }
}

// =======================================================================
//              CUSTOM NOTIFICATIONS
class CustomNotifications {
  late final int id;
  late final String? title;
  late final String? body;
  late final String? payload;

  CustomNotifications(this.id, this.title, this.body, this.payload);
}

// class NotificationService {
//   late FlutterLocalNotificationsPlugin localNotificationsPlugin;
//   late AndroidNotificationDetails androidDetails;

//   NotificationService() {
//     localNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   }

//   _setupNotifications() async {
//     await _setupTimeZone();
//     await _initializeNotifications();
//   }

//   Future<void> _setupTimeZone() async {
//     tz.initializeTimeZones();
//     final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(timeZoneName!));
//   }

//   _initializeNotifications() async {
//     const android = AndroidInitializationSettings('@mipmap/ic_launcher');
//     await localNotificationsPlugin.initialize(
//       const InitializationSettings(android: android),
//       onDidReceiveNotificationResponse: (details) =>
//           _onSelectedNotification(details),
//     );
//   }

//   _onSelectedNotification(NotificationResponse details) {
//     print(details);
//   }

//   showNotification(CustomNotifications notification) {
//     androidDetails = const AndroidNotificationDetails(
//         "notification_id_1", "Lembrete 1",
//         channelDescription: "descrição do canal: canal de lembretes",
//         importance: Importance.max,
//         priority: Priority.max);
//     localNotificationsPlugin.show(notification.id, notification.title,
//         notification.body, NotificationDetails(android: androidDetails),
//         payload: notification.payload);
//   }

//   checkForNotifications() async {
//     final details =
//         await localNotificationsPlugin.getNotificationAppLaunchDetails();
//     if (details != null && details.didNotificationLaunchApp) {
//       _onSelectedNotification(details.notificationResponse!);
//     }
//   }
// }
