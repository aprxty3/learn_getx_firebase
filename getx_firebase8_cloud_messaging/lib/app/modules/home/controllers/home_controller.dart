import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomeController extends GetxController {
  void dijalankan() async {
    print('Dijalankan');
    // subscribe to topic on each app start-up
    await FirebaseMessaging.instance.subscribeToTopic('weather');
  }
}
