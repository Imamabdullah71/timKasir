import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/Models/barang_model.dart';

class TransaksiController extends GetxController {
  final RxList<BarangModel> items = <BarangModel>[].obs;
  final RxMap<String, int> itemCounts = <String, int>{}.obs;
  final RxDouble totalAmount = 0.0.obs;

  // Rx untuk query pencarian
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  // Metode untuk mendapatkan daftar barang dari Firestore
  void fetchItems() async {
    final barangSnapshot =
        await FirebaseFirestore.instance.collection('barang').get();

    for (var doc in barangSnapshot.docs) {
      var barang = BarangModel.fromFirestore(doc);

      var hargaSnapshot = await FirebaseFirestore.instance
          .collection('harga')
          .where('barang_id', isEqualTo: barang.id)
          .get();

      if (hargaSnapshot.docs.isNotEmpty) {
        var hargaData = hargaSnapshot.docs.first.data();

        if (hargaData['harga_jual'] is int) {
          barang.hargaJual = (hargaData['harga_jual'] as int).toDouble();
        } else if (hargaData['harga_jual'] is double) {
          barang.hargaJual = hargaData['harga_jual'];
        } else {
          barang.hargaJual = 0.0;
        }
      } else {
        barang.hargaJual = 0.0;
      }

      items.add(barang);
    }
  }

  // Metode untuk menambahkan barang ke keranjang
  void addItem(String itemId) {
    itemCounts[itemId] = (itemCounts[itemId] ?? 0) + 1;
    updateTotal();
  }

  // Metode untuk mengurangi jumlah barang dari keranjang
  void removeItem(String itemId) {
    if (itemCounts[itemId] != null && itemCounts[itemId]! > 0) {
      itemCounts[itemId] = itemCounts[itemId]! - 1;
      if (itemCounts[itemId] == 0) {
        itemCounts.remove(itemId);
      }
      updateTotal();
    }
  }

  // Metode untuk menghapus barang dari keranjang
  void deleteItem(String itemId) {
    itemCounts.remove(itemId);
    Get.back();
  }

  // Metode untuk memperbarui total harga transaksi
  void updateTotal() {
    double total = 0.0;
    itemCounts.forEach((itemId, hitung) {
      var item = items.firstWhere((item) => item.id == itemId);
      var harga = item.hargaJual ?? 0.0;
      total += harga * hitung;
    });
    totalAmount.value = total;
  }

  // Metode untuk menyelesaikan transaksi
  void finalizeTransaction(int amountGiven) {
    List<String> detailBarang = itemCounts.entries.map((entry) {
      var item = items.firstWhere((item) => item.id == entry.key);
      return "${item.namaBarang} ×${entry.value}";
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

  // Getter untuk mendapatkan daftar barang yang difilter
  List<BarangModel> get filteredItems {
    if (searchQuery.isEmpty) {
      return items;
    } else {
      return items.where((item) {
        return item.namaBarang
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
      }).toList();
    }
  }
}
