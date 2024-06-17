import 'package:cloud_firestore/cloud_firestore.dart';

class TransaksiModel {
  final String id;
  final List<String> detailBarang;
  final double totalHarga;
  final double bayar;
  final double kembali;
  final Timestamp timestamp;
  final int totalBarang;

  TransaksiModel({
    required this.id,
    required this.detailBarang,
    required this.totalHarga,
    required this.bayar,
    required this.kembali,
    required this.timestamp,
    required this.totalBarang,
  });

  factory TransaksiModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TransaksiModel(
      id: doc.id,
      detailBarang: List<String>.from(data['detail_barang'] ?? []),
      totalHarga: data['total_harga'].toDouble() ?? 0.0,
      bayar: data['bayar'].toDouble() ?? 0.0,
      kembali: data['kembali'].toDouble() ?? 0.0,
      timestamp: data['timestamp'] ?? Timestamp.now(),
      totalBarang: data['total_barang'] ?? 0,
    );
  }
}
