class DetailTransaksiModel {
  String id;
  String transaksiId;
  String supplierId;
  String barangId;
  String hargaId;
  int quantity;
  double harga;

  DetailTransaksiModel({
    required this.id,
    required this.transaksiId,
    required this.supplierId,
    required this.barangId,
    required this.hargaId,
    required this.quantity,
    required this.harga,
  });

  factory DetailTransaksiModel.fromJson(Map<String, dynamic> json) {
    return DetailTransaksiModel(
      id: json['id_detail_transaksi_jual'],
      transaksiId: json['id_transaksi_jual'],
      supplierId: json['id_supplier'],
      barangId: json['id_barang'],
      hargaId: json['id_harga'],
      quantity: json['quantity'],
      harga: json['harga'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_detail_transaksi_jual': id,
      'id_transaksi_jual': transaksiId,
      'id_supplier': supplierId,
      'id_barang': barangId,
      'id_harga': hargaId,
      'quantity': quantity,
      'harga': harga,
    };
  }
}
