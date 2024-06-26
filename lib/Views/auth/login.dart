import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tim_kasir/Controllers/auth_controller.dart';
import 'package:tim_kasir/Controllers/bottom_bar_controller.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatelessWidget {
  final AuthController authC = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailFromRegister = Get.arguments != null ? Get.arguments['email'] : null;
    if (emailFromRegister != null) {
      emailController.text = emailFromRegister;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Masuk".toUpperCase(),
          style: GoogleFonts.kanit(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 94, 225),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      contentPadding: const EdgeInsets.only(left: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          authC.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: authC.togglePasswordVisibility,
                      ),
                    ),
                    obscureText: !authC.isPasswordVisible.value,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/halaman_reset_password');
                    },
                    child: const Text(
                      "Reset Password",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 114, 94, 225),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 114, 94, 225),
                    minimumSize: const Size(double.infinity, 48),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  ),
                  onPressed: () async {
                    bool success = await authC.loginFC(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );

                    if (success) {
                      User? user = FirebaseAuth.instance.currentUser;
                      if (user != null && !user.emailVerified) {
                        Get.snackbar(
                          "Email belum diverifikasi",
                          "Silakan verifikasi email Anda terlebih dahulu.",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        return; // Stop the login process if email is not verified
                      }
                      // Update selectedIndex to Home
                      final BottomBarController bottomBarController = Get.find();
                      bottomBarController.resetToHome(); // Reset to Home page
                      Get.offNamed('/halaman_utama'); // Navigasi ke halaman utama setelah login berhasil
                    }
                  },
                  child: Text(
                    'Masuk'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (emailFromRegister != null) Obx(
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: authC.isResendButtonEnabled.value ? const Color.fromARGB(255, 114, 94, 225) : Colors.grey,
                      minimumSize: const Size(double.infinity, 48),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                    onPressed: authC.isResendButtonEnabled.value
                        ? () {
                            Get.dialog(
                              AlertDialog(
                                title: Text("Kirimkan ulang verifikasi ke $emailFromRegister?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("Kembali"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await authC.resendVerificationEmail();
                                      authC.startResendEmailTimer();
                                      Get.back();
                                    },
                                    child: const Text("Ya, kirim ulang"),
                                  ),
                                ],
                              ),
                            );
                          }
                        : null,
                    child: Text(
                      authC.isResendButtonEnabled.value
                          ? 'Kirim Ulang'
                          : 'Kirim Ulang (${authC.resendButtonCountdown.value})',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Belum punya akun Tim Kasir?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 114, 94, 225),
                      minimumSize: const Size(
                        70, // Lebar
                        48, // Tinggi
                      ),
                      padding:
                          const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    ),
                    onPressed: () {
                      Get.toNamed('/halaman_daftar');
                    },
                    child: const Text(
                      'Daftar di sini',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
