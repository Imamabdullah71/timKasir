import 'package:get/get.dart';

class CountdownController extends GetxController {
  var isStarted = false.obs;
  var isCountdownFinished = false.obs;
  var countdownTime = 5.obs; // Hitung mundur 5 detik

  void startCountdown() {
    isStarted.value = true;
    isCountdownFinished.value = false;
    countdownTime.value = 5;
    Future.delayed(Duration(seconds: 5), () {
      isCountdownFinished.value = true;
    });

    for (int i = 1; i <= 5; i++) {
      Future.delayed(Duration(seconds: i), () {
        countdownTime.value -= 1;
      });
    }
  }
}
