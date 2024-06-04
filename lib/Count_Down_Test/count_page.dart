import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Count_Down_Test/countdown_controller.dart';

class CountPage extends StatelessWidget {
  final CountdownController countdownController =
      Get.put(CountdownController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countdown Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                countdownController.startCountdown();
              },
              child: Text('Mulai'),
            ),
            Obx(() {
              if (countdownController.isStarted.value) {
                return ElevatedButton(
                  onPressed: countdownController.isCountdownFinished.value
                      ? () {
                          Get.dialog(AlertDialog(
                            title: Text('Berhasil'),
                            content: Text('Hitungan mundur selesai.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                  
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ));
                        }
                      : null,
                  child: Obx(() {
                    return Text(countdownController.isCountdownFinished.value
                            ? 'Silahkan Klik'
                            : 'Waktu tersisa: ${countdownController.countdownTime.value} detik'
                        // 'Waktu tersisa: ${countdownController.countdownTime.value} detik',
                        );
                  }),
                );
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
