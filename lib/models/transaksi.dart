import 'package:cloud_firestore/cloud_firestore.dart';

class TransaksiModel {
  String id;
  String userId;
  String supplierId;
  DateTime tanggal;
  double harga;
  double bayar;
  String status;

  TransaksiModel({
    required this.id,
    required this.userId,
    required this.supplierId,
    required this.tanggal,
    required this.harga,
    required this.bayar,
    required this.status,
  });

  factory TransaksiModel.fromJson(Map<String, dynamic> json) {
    return TransaksiModel(
      id: json['id_transaksi_jual'],
      userId: json['id_user'],
      supplierId: json['id_supplier'],
      tanggal: (json['tanggal'] as Timestamp).toDate(),
      harga: json['harga'].toDouble(),
      bayar: json['bayar'].toDouble(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_transaksi_jual': id,
      'id_user': userId,
      'id_supplier': supplierId,
      'tanggal': Timestamp.fromDate(tanggal),
      'harga': harga,
      'bayar': bayar,
      'status': status,
    };
  }
}
