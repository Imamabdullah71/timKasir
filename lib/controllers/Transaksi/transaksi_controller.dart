// Controllers/transaksi_controller.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Models/barang_model.dart';

class TransaksiController extends GetxController {
  final RxList<BarangModel> items = <BarangModel>[].obs;
  final RxMap<String, int> itemCounts = <String, int>{}.obs;
  final RxDouble totalAmount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() async {
    final barangSnapshot =
        await FirebaseFirestore.instance.collection('barang').get();

    for (var doc in barangSnapshot.docs) {
      var barang = BarangModel.fromFirestore(doc);

      // Fetch harga for this barang
      var hargaSnapshot = await FirebaseFirestore.instance
          .collection('harga')
          .where('barang_id', isEqualTo: barang.id)
          .get();

      if (hargaSnapshot.docs.isNotEmpty) {
        var hargaData = hargaSnapshot.docs.first.data() as Map<String, dynamic>;

        // Konversi harga_jual ke double
        if (hargaData['harga_jual'] is int) {
          barang.hargaJual = (hargaData['harga_jual'] as int).toDouble();
        } else if (hargaData['harga_jual'] is double) {
          barang.hargaJual = hargaData['harga_jual'];
        } else {
          barang.hargaJual = 0.0; // Nilai default jika tipe tidak terduga
        }
      } else {
        barang.hargaJual = 0.0; // Nilai default jika tidak ada harga ditemukan
      }

      items.add(barang);
    }
  }

  void addItem(String itemId) {
    itemCounts[itemId] = (itemCounts[itemId] ?? 0) + 1;
    updateTotal();
  }

  void removeItem(String itemId) {
    if (itemCounts[itemId] != null && itemCounts[itemId]! > 0) {
      itemCounts[itemId] = itemCounts[itemId]! - 1;
      if (itemCounts[itemId] == 0) {
        itemCounts.remove(itemId);
      }
      updateTotal();
    }
  }

  void deleteItem(String itemId) {
    itemCounts.remove(itemId);
    Get.back();
  }

  void updateTotal() {
    double total = 0.0;
    itemCounts.forEach((itemId, count) {
      var item = items.firstWhere((item) => item.id == itemId);
      var harga = item.hargaJual ?? 0.0;
      total += harga * count;
    });
    totalAmount.value = total;
  }

  void finalizeTransaction(int amountGiven) {
    List<String> detailBarang = itemCounts.entries.map((entry) {
      var item = items.firstWhere((item) => item.id == entry.key);
      return "${item.namaBarang} × ${entry.value}";
    }).toList();

    FirebaseFirestore.instance.collection('transaksi').add({
      'total_barang': itemCounts.values.reduce((a, b) => a + b),
      'total_harga': totalAmount.value,
      'bayar': amountGiven,
      'kembali': amountGiven - totalAmount.value,
      'detail_barang': detailBarang,
      'timestamp': Timestamp.now(),
    });

    itemCounts.clear();
    totalAmount.value = 0.0;
  }
}
