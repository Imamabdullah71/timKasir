import 'package:cloud_firestore/cloud_firestore.dart';

class BarangModel {
  final String id;
  final String namaBarang;
  final String kodeBarang;
  final int stokBarang;
  final String kategoriId;
  final String fotoUrl;
  final Timestamp time;
  double? hargaJual;

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

    return BarangModel(
      id: doc.id,
      namaBarang: data['nama_barang'] ?? '',
      kodeBarang: data['kode_barang'].toString(),
      stokBarang: data['stok_barang'] ?? 0,
      kategoriId: data['kategori_id'] ?? '',
      fotoUrl: data['foto_url'] ?? '',
      time: data['time'] is Timestamp
          ? data['time']
          : Timestamp.fromDate(
              DateTime.parse(data['time'] ?? DateTime.now().toString())),
      hargaJual: (data['harga_jual'] as num?)?.toDouble() ?? 0.0,
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
