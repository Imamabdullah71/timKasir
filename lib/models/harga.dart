class HargaModel {
  String id;
  double hargaJual;
  double hargaBeli;

  HargaModel({
    required this.id,
    required this.hargaJual,
    required this.hargaBeli,
  });

  factory HargaModel.fromJson(Map<String, dynamic> json) {
    return HargaModel(
      id: json['id_harga'],
      hargaJual: json['harga_jual'].toDouble(),
      hargaBeli: json['harga_beli'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_harga': id,
      'harga_jual': hargaJual,
      'harga_beli': hargaBeli,
    };
  }
}
