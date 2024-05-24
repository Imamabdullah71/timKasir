import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timkasirapp/controllers/authController.dart';
import 'package:timkasirapp/controllers/bottomBar_controller.dart'; // Import BottomBarController
import 'package:timkasirapp/pages/auth/daftar.dart';
import 'package:timkasirapp/pages/auth/login.dart';
import 'package:timkasirapp/pages/auth/reset_password.dart';
import 'package:timkasirapp/pages/management_barang/page_menu/barang.dart';
import 'package:timkasirapp/pages/management_barang/page_menu/kategori_barang.dart';
import 'package:timkasirapp/pages/management_barang/page_menu/tambah_barang.dart';
import 'package:timkasirapp/pages/laporan.dart';
import 'package:timkasirapp/pages/leading_pages/mainLeading.dart';
import 'package:timkasirapp/pages/profile.dart';
import 'package:timkasirapp/pages/scan_test.dart';
import 'package:timkasirapp/pages/transaksi.dart';
import 'package:timkasirapp/pages/transaksi/bayar.dart';
import 'pages/management_barang/manage_barang.dart';
import 'bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
        Get.lazyPut<BottomBarController>(() => BottomBarController()); // Inisialisasi BottomBarController
      }),
      getPages: [
        GetPage(
          name: "/halaman_intro",
          page: () => PageOneL()
        ),
        GetPage(
          name: "/halaman_utama",
          page: () => BottomBar()
        ),
        GetPage(
          name: "/halaman_login",
          page: () => LoginPage()
        ),
        GetPage(
          name: "/halaman_daftar",
          page: () => DaftarPage()
        ),
        GetPage(name: "/halaman_reset_password", page: () => ResetPasswordPage()),
        GetPage(
          name: "/manage_barang",
          page: () => ManageBarang()
        ),
        GetPage(
          name: "/halaman_barang",
          page: () => PageBarang()
        ),
        GetPage(
          name: "/halaman_kategori_barang",
          page: () => KategoriBarang()
        ),
        GetPage(
          name: "/tambah_barang",
          page: () => tambahBarang()
        ),
        GetPage(
          name: "/transaksi",
          page: () => Transaksi()
        ),
        GetPage(
          name: "/halaman_bayar",
          page: () => Pembayaran()
        ),
        GetPage(
          name: "/halaman_laporan",
          page: () => Laporan()
        ),
        GetPage(
          name: "/halaman_pengaturan",
          page: () => Pengaturan()
        ),
        
        GetPage(
          name: "/halaman_scan",
          page: () => TestingBarcode()
        ),
      ],
      debugShowCheckedModeBanner: false,
      home: AuthHandler(),
    );
  }
}

class AuthHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print('Connection is active');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          User? user = snapshot.data;
          if (user != null && !user.emailVerified) {
            // Jika pengguna belum verifikasi email, arahkan ke halaman login dengan pesan
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.snackbar(
                "Email belum diverifikasi",
                "Silakan verifikasi email Anda terlebih dahulu.",
              );
            });
            return LoginPage(); // Halaman login atau halaman verifikasi email
          } else {
            return BottomBar();
          }
        } else {
          return PageOneL();
        }
      },
    );
  }
}
