import 'package:cloud_firestore/cloud_firestore.dart';

class InfaqModel {
  String id;
  String userId;
  DateTime date;
  double amount;
  String description;

  InfaqModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.amount,
    required this.description,
  });

  factory InfaqModel.fromJson(Map<String, dynamic> json) {
    return InfaqModel(
      id: json['id_infaq'],
      userId: json['id_user'],
      date: (json['tanggal'] as Timestamp).toDate(),
      amount: json['jumlah'].toDouble(),
      description: json['deskripsi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_infaq': id,
      'id_user': userId,
      'tanggal': Timestamp.fromDate(date),
      'jumlah': amount,
      'deskripsi': description,
    };
  }
}
