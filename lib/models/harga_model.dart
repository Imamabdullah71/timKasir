// models/harga_model.dart:
import 'package:cloud_firestore/cloud_firestore.dart';

class HargaModel {
  final String id;
  final int hargaBeli;
  final int hargaJual;
  final String barangId;

  HargaModel({
    required this.id,
    required this.hargaBeli,
    required this.hargaJual,
    required this.barangId,
  });

  factory HargaModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return HargaModel(
      id: doc.id,
      hargaBeli: data['harga_beli'] ?? 0,
      hargaJual: data['harga_jual'] ?? 0,
      barangId: data['barang_id'] ?? '',
    );
  }
}
