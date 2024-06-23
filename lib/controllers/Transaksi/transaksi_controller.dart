import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tim_kasir/Models/barang_model.dart';

class TransaksiController extends GetxController {
  final RxList<BarangModel> items = <BarangModel>[].obs;
  final RxMap<String, int> itemCounts = <String, int>{}.obs;
  final RxDouble totalAmount = 0.0.obs;
  final RxDouble totalHargaBeli = 0.0.obs; // Field untuk total harga beli

  final RxString searchQuery = ''.obs;

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
    double totalBeli = 0.0;

    itemCounts.forEach((itemId, hitung) {
      var item = items.firstWhere((item) => item.id == itemId);
      var hargaJual = item.hargaJual ?? 0.0;
      total += hargaJual * hitung;

      var hargaBeli = _getHargaBeli(item.id); // Dapatkan harga beli
      totalBeli += hargaBeli * hitung;
    });

    totalAmount.value = total;
    totalHargaBeli.value = totalBeli; // Perbarui total harga beli
  }

  double _getHargaBeli(String barangId) {
    // Ambil harga beli dari Firestore atau cache
    // Misalnya, kita asumsikan harga beli dari barang sama dengan harga jual untuk contoh ini
    return items.firstWhere((item) => item.id == barangId).hargaJual ?? 0.0;
  }

  void finalizeTransaction(int amountGiven) async {
    List<String> detailBarang = itemCounts.entries.map((entry) {
      var item = items.firstWhere((item) => item.id == entry.key);
      return "${item.namaBarang} ×${entry.value}";
    }).toList();

    var transaksiRef = FirebaseFirestore.instance.collection('transaksi').doc();
    await transaksiRef.set({
      'total_barang': itemCounts.values.reduce((a, b) => a + b),
      'total_harga': totalAmount.value,
      'total_harga_beli': totalHargaBeli.value, // Tambahkan total harga beli
      'bayar': amountGiven,
      'kembali': amountGiven - totalAmount.value,
      'detail_barang': detailBarang,
      'timestamp': Timestamp.now(),
    });

    itemCounts.clear();
    totalAmount.value = 0.0;
    totalHargaBeli.value = 0.0; // Reset total harga beli setelah transaksi
  }

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
