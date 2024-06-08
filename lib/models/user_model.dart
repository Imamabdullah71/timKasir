// models/user_model.dart:
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String nama;
  final String namaToko;
  final String alamat;
  final String jenisKelamin;
  final String noHp;
  final String fotoUrl;

  UserModel({
    required this.nama,
    required this.namaToko,
    required this.alamat,
    required this.jenisKelamin,
    required this.noHp,
    required this.fotoUrl,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      nama: data['nama'] ?? '',
      namaToko: data['nama_toko'] ?? '',
      alamat: data['alamat'] ?? '',
      jenisKelamin: data['jenis_kelamin'] ?? '',
      noHp: data['no_hp'] ?? '',
      fotoUrl: data['foto_url'] ?? '',
    );
  }
}