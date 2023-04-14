import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAwesomeNotification extends StatefulWidget {
  const MyAwesomeNotification({super.key});

  @override
  State<MyAwesomeNotification> createState() => _MyAwesomeNotificationState();
}

class _MyAwesomeNotificationState extends State<MyAwesomeNotification> {
  NotificationService service = NotificationService();
  int valor = 0;

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // valor = !valor;
                // if (valor) {
                //   // service.showNotification(
                //   //     CustomNotifications(1, "teste", "Acesse o App", '/zoom'));
                // }
                valor = 0;
                service._updateCurrentProgressBar(
                    id: 1, currentPage: 0, maxPages: 20);
              },
              child: const Text("Show Notification"),
            ),
            TextButton(
              onPressed: () {
                valor++;
                service._updateCurrentProgressBar(
                    id: 1, currentPage: valor, maxPages: 20);
              },
              child: const Text("More"),
            ),
          ],
        )),
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

class NotificationService {
  void _updateCurrentProgressBar(
      {required int id, required int currentPage, required int maxPages}) {
    if (currentPage == maxPages) {
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: id,
              channelKey: 'progress_bar',
              title: 'Download finished',
              body: 'filename.txt',
              category: NotificationCategory.Progress,
              // payload: {
              //   'file': 'filename.txt',
              //   'path': '-rmdir c://ruwindows/system32/huehuehue'
              // },
              locked: false));
    } else {
      int progress = ((100 * currentPage) / maxPages).round();
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: id,
              channelKey: 'progress_bar',
              title: 'Downloading fake file in progress ($progress%)',
              body: 'filename.txt',
              category: NotificationCategory.Progress,
              // payload: {
              //   'file': 'filename.txt',
              //   'path': '-rmdir c://ruwindows/system32/huehuehue'
              // },
              notificationLayout: NotificationLayout.ProgressBar,
              progress: progress,
              locked: true));
    }
  }
}
