import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Barang/detail_barang.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Barang/edit_barang.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Barang/tambah_barang.dart';
import 'package:timkasirapp/Count_Down_Test/count_page.dart';
import 'package:timkasirapp/Controllers/produk_controller/add_product_controller.dart';
import 'package:timkasirapp/Controllers/authController.dart';
import 'package:timkasirapp/Controllers/bottomBar_controller.dart';
import 'package:timkasirapp/Controllers/home_controller.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Kategori/kategori.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Kategori/tambah_kategori.dart';
import 'package:timkasirapp/infaq.dart';
import 'package:timkasirapp/Pages/auth/daftar.dart';
import 'package:timkasirapp/Pages/auth/login.dart';
import 'package:timkasirapp/Pages/auth/reset_password.dart';
import 'package:timkasirapp/Pages/crud/edit_produk.dart';
import 'package:timkasirapp/Pages/management_barang/page_menu_management/Barang/barang.dart';
import 'package:timkasirapp/Pages/laporan.dart';
import 'package:timkasirapp/Pages/leading_pages/mainLeading.dart';
import 'package:timkasirapp/Pages/profile.dart';
import 'package:timkasirapp/Pages/transaksi.dart';
import 'package:timkasirapp/Pages/transaksi/bayar.dart';
import 'package:timkasirapp/Pages/crud/tambah_product.dart';
import 'package:timkasirapp/upload_file/upload_page.dart';
import 'Pages/management_barang/manage_barang.dart';
import 'bottom_bar.dart';
import 'package:timkasirapp/bindings.dart';

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
        Get.lazyPut<BottomBarController>(() => BottomBarController());
        Get.lazyPut<AddProductController>(() => AddProductController());
        Get.lazyPut<HomeController>(() => HomeController());
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
        GetPage(name: "/manage_barang", page: () => ManageBarang()),
        GetPage(
          name: "/halaman_barang",
          page: () => PageBarang(),
          binding: TambahDataBinding(),
        ),
        GetPage(name: "/transaksi", page: () => Transaksi()),
        GetPage(name: "/halaman_bayar", page: () => Pembayaran()),
        GetPage(name: "/halaman_laporan", page: () => Laporan()),
        GetPage(name: "/halaman_pengaturan", page: () => Pengaturan()),
        GetPage(
          name: "/tambah_data_produk",
          page: () => TambahDataPage(),
          binding: TambahDataBinding(),
        ),
        GetPage(
          name: "/edit_data_produk",
          page: () => EditDataPage(),
          binding: TambahDataBinding(),
        ),
        GetPage(
          name: "/infaq_page",
          page: () => InfaqScreen(),
          binding: TambahDataBinding(),
        ),
        GetPage(name: "/count_page", page: () => CountPage()),
        GetPage(
          name: "/upload_page",
          page: () => UploadPage(),
          binding: TambahDataBinding(),
        ),
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
