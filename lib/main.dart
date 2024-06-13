import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timkasirapp/Controllers/Transaksi/transaksi_controller.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Barang/detail_barang.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Barang/edit_barang.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Barang/tambah_barang.dart';
import 'package:timkasirapp/Count_Down_Test/count_page.dart';
import 'package:timkasirapp/Controllers/auth_controller.dart';
import 'package:timkasirapp/Controllers/bottomBar_controller.dart';
import 'package:timkasirapp/Controllers/home_controller.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Kategori/kategori.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Kategori/tambah_kategori.dart';
import 'package:timkasirapp/Pages/auth/daftar.dart';
import 'package:timkasirapp/Pages/auth/login.dart';
import 'package:timkasirapp/Pages/auth/reset_password.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Barang/barang.dart';
import 'package:timkasirapp/Pages/laporan.dart';
import 'package:timkasirapp/Pages/landing_pages/main_landing.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Stok_Barang/stok_barang.dart';
import 'package:timkasirapp/Pages/profile.dart';
import 'package:timkasirapp/Pages/transaksi.dart';
import 'package:timkasirapp/Pages/transaksi/payment_page.dart';
import 'package:timkasirapp/Pages/transaksi/transaksi_page.dart';
import 'package:timkasirapp/Pages/transaksi/success%20_transaksi_page.dart';
import 'package:timkasirapp/Pages/transaksi/transaksi_detail_page.dart';
import 'Pages/management_barang/main_menu_barang.dart';
import 'bottom_bar.dart';
import 'package:timkasirapp/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<AuthController>(() => AuthController());
        Get.lazyPut<BottomBarController>(() => BottomBarController());
        Get.lazyPut<HomeController>(() => HomeController());
        Get.lazyPut<TransaksiController>(() => TransaksiController());
      }),
      getPages: [
        GetPage(
          name: "/bottom_bar",
          page: () => BottomBar(),
          binding: TambahDataBinding(),
        ),
        GetPage(name: "/halaman_intro", page: () => PageOneL()),
        GetPage(name: "/halaman_utama", page: () => BottomBar()),
        GetPage(name: "/halaman_login", page: () => LoginPage()),
        GetPage(name: "/halaman_daftar", page: () => DaftarPage()),
        GetPage(
            name: "/halaman_reset_password", page: () => ResetPasswordPage()),
        GetPage(name: "/manage_barang", page: () => const ManageBarang()),
        GetPage(
          name: "/halaman_barang",
          page: () => PageBarang(),
          binding: TambahDataBinding(),
        ),
        GetPage(name: "/transaksi", page: () => const Transaksi()),
        GetPage(name: "/halaman_laporan", page: () => const Laporan()),
        GetPage(name: "/halaman_pengaturan", page: () => const Pengaturan()),
        GetPage(name: "/count_page", page: () => CountPage()),
        // Barang
        GetPage(
          name: "/upload_page_barang",
          page: () => TambahBarangPage(),
          binding: TambahDataBinding(),
        ),
        GetPage(
          name: "/detail_page_barang",
          page: () => DetailBarangPage(),
          binding: TambahDataBinding(),
        ),
        GetPage(
          name: "/edit_page_barang",
          page: () => EditBarangPage(),
          binding: TambahDataBinding(),
        ),
        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        // Kategori
        GetPage(
          name: "/kategori_page",
          page: () => KategoriPage(),
          binding: TambahDataBinding(),
        ),
        GetPage(
          name: "/tambah_kategori_page",
          page: () => TambahKategoriPage(),
          binding: TambahDataBinding(),
        ),
        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        // Transaksi
        GetPage(
          name: "/transaksi_page",
          page: () => TransaksiPage(),
          binding: TambahDataBinding(),
        ),
        GetPage(
          name: "/transaksi_detail",
          page: () => TransaksiDetailPage(),
          binding: TambahDataBinding(),
        ),
        GetPage(
          name: "/payment_page",
          page: () => PaymentPage(),
          binding: TambahDataBinding(),
        ),
        GetPage(
            name: "/success_transaksi_page",
            page: () => SuccessTransaksiPage()),
        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        // Stok Barang
        GetPage(
          name: "/stok_barang_page",
          page: () => StokBarangPage(),
          binding: TambahDataBinding(),
        ),
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        //Ini hanya bagaian untuk testing page, hapus jika tidak digunakan
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      ],
      debugShowCheckedModeBanner: false,
      home: AuthHandler(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class AuthHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // ignore: avoid_print
          print('Connection is active');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          User? user = snapshot.data;
          if (user != null && !user.emailVerified) {
            // If user has not verified their email, redirect to the login page with a message
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Get.snackbar(
                "Email not verified",
                "Please verify your email first.",
              );
            });
            return LoginPage(); // Login or email verification page
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
