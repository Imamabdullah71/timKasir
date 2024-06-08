// models/barang_model.dart:
import 'package:cloud_firestore/cloud_firestore.dart';

class BarangModel {
  final String id;
  final String namaBarang;
  final String kodeBarang;
  final int stokBarang;
  final String kategoriId;
  final String fotoUrl;
  final Timestamp time;
  double? hargaJual; // Jadikan hargaJual dapat diubah

  BarangModel({
    required this.id,
    required this.namaBarang,
    required this.kodeBarang,
    required this.stokBarang,
    required this.kategoriId,
    required this.fotoUrl,
    required this.time,
    this.hargaJual,
  });

  factory BarangModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    String kodeBarangString;
    if (data['kode_barang'] is int) {
      kodeBarangString = data['kode_barang'].toString();
    } else if (data['kode_barang'] is String) {
      kodeBarangString = data['kode_barang'];
    } else {
      kodeBarangString = '';
    }

    Timestamp timestamp;
    if (data['time'] is String) {
      try {
        timestamp = Timestamp.fromDate(DateTime.parse(data['time']));
      } catch (e) {
        timestamp = Timestamp.now();
      }
    } else if (data['time'] is Timestamp) {
      timestamp = data['time'];
    } else {
      timestamp = Timestamp.now();
    }

    return BarangModel(
      id: doc.id,
      namaBarang: data['nama_barang'] ?? '',
      kodeBarang: kodeBarangString,
      stokBarang: data['stok_barang'] ?? 0,
      kategoriId: data['kategori_id'] ?? '',
      fotoUrl: data['foto_url'] ?? '',
      time: timestamp,
      hargaJual: (data['harga_jual'] as double?) ?? 0.0, // Nilai default
    );
  }

  BarangModel copyWith({
    String? id,
    String? namaBarang,
    String? kodeBarang,
    int? stokBarang,
    String? kategoriId,
    String? fotoUrl,
    Timestamp? time,
    double? hargaJual,
  }) {
    return BarangModel(
      id: id ?? this.id,
      namaBarang: namaBarang ?? this.namaBarang,
      kodeBarang: kodeBarang ?? this.kodeBarang,
      stokBarang: stokBarang ?? this.stokBarang,
      kategoriId: kategoriId ?? this.kategoriId,
      fotoUrl: fotoUrl ?? this.fotoUrl,
      time: time ?? this.time,
      hargaJual: hargaJual ?? this.hargaJual,
    );
  }
}
