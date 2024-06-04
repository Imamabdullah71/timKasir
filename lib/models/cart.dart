class CartModel {
  String id;
  String barangId;
  String hargaId;
  int quantity;
  double bayar;
  double subtotal;

  CartModel({
    required this.id,
    required this.barangId,
    required this.hargaId,
    required this.quantity,
    required this.bayar,
    required this.subtotal,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id_cart'],
      barangId: json['id_barang'],
      hargaId: json['id_harga'],
      quantity: json['quantity'],
      bayar: json['bayar'].toDouble(),
      subtotal: json['subtotal'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_cart': id,
      'id_barang': barangId,
      'id_harga': hargaId,
      'quantity': quantity,
      'bayar': bayar,
      'subtotal': subtotal,
    };
  }
}
