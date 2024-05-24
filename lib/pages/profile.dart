import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/widgets/widgetDrawer.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import '../controllers/authController.dart';

class Pengaturan extends StatelessWidget {
  const Pengaturan({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    final user = authController.getCurrentUser();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius:
                  50.0, // Mengatur radius menjadi 50.0, ini menentukan ukuran lingkaran
              // backgroundImage: AssetImage('assets/images/barang/coklat.jpg'), // Gambar untuk avatar
              // Jika ingin menggunakan warna latar belakang:
              backgroundColor: Colors.grey[300],
              // Jika ingin menggunakan ikon sebagai gambar:
              child: Icon(Icons.person, size: 50.0),
            ),
            SizedBox(height: 20),
            Text(
              "Profil",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama"),
                    SizedBox(height: 10),
                    Text(user?.displayName ?? "Nama Pemilik"),
                    SizedBox(height: 20),
                    Text("Email"),
                    SizedBox(height: 10),
                    Text(user?.email ?? "email@gmail.com"),
                    SizedBox(height: 20),
                    Text("Telepon"),
                    SizedBox(height: 10),
                    Text("08731253614"),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        authController.logoutFC();
                      },
                      child: Text("Logout"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (user != null) {
                          Get.dialog(
                            AlertDialog(
                              title: Text("Raw User Data"),
                              content: SingleChildScrollView(
                                child: Text(user.toString()),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                            ),
                          );
                        } else {
                          Get.snackbar("Error", "User not logged in");
                        }
                      },
                      child: Text("Lihat Raw data"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
