import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timkasirapp/models/transaksi.dart';

class TransaksiController extends GetxController {
  var transaksiList = <TransaksiModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransaksi();
  }

  void fetchTransaksi() {
    FirebaseFirestore.instance.collection('Transaksi').snapshots().listen((snapshot) {
      transaksiList.value = snapshot.docs.map((doc) => TransaksiModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  void addTransaksi(TransaksiModel transaksi) {
    FirebaseFirestore.instance.collection('Transaksi').add(transaksi.toJson()).then((doc) {
      transaksi.id = doc.id;
      transaksiList.add(transaksi);
    }).catchError((error) {
      print("Failed to add transaksi: $error");
    });
  }
}
