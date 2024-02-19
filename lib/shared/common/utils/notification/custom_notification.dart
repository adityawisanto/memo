import 'package:memo/packages/packages.dart';

class CustomNotification {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      ),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static void createAndDisplayNotification(
    String title,
    String description,
  ) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "memo",
          "memo-channel",
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          categoryIdentifier: "memo",
        ),
      );

      await _notificationsPlugin.show(
        id,
        title,
        description,
        notificationDetails,
        payload: "ticket",
      );
    } on Exception catch (e) {
      debugPrint(
        e.toString(),
      );
    }
  }
}
