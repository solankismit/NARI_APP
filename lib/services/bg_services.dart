import 'package:flutter_background/flutter_background.dart';
final androidConfig = FlutterBackgroundAndroidConfig(
  notificationTitle: "flutter_background example app",
  notificationText: "Background notification for keeping the example app running in the background",
  notificationImportance: AndroidNotificationImportance.Default,
  notificationIcon: AndroidResource(name: 'background_icon', defType: 'drawable'), // Default is ic_launcher from folder mipmap
);