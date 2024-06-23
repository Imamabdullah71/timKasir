import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tim_kasir/Controllers/auth_controller.dart';

// ignore: use_key_in_widget_constructors
class DaftarPage extends StatelessWidget {
  final AuthController authC = Get.find();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daftar Akun".toUpperCase(),
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
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    contentPadding: const EdgeInsets.only(left: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    text: "Dengan mendaftar, Anda telah menyetujui \n",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: "Syarat Ketentuan & Kebijakan Privasi",
                        style: const TextStyle(
                          color: const Color.fromARGB(255, 114, 94, 225),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Implementasi halaman Syarat Ketentuan & Kebijakan Privasi
                          },
                      ),
                    ],
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
                    bool success = await authC.registerFC(
                      nameController.text.trim(),
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      phoneController.text.trim(),
                    );

                    if (success) {
                      await authC.sendVerificationEmail();
                      Get.offNamed('/halaman_login', arguments: {'email': emailController.text.trim()}); // Navigasi ke halaman login setelah pendaftaran berhasil
                    }
                  },
                  child: Text(
                    'Daftar'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
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
                    "Sudah punya akun Tim Kasir?",
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
                      Get.toNamed('/halaman_login');
                    },
                    child: const Text(
                      'Masuk di sini',
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
