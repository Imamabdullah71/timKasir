class BarangModel {
  String id;
  String kategoriId;
  String supplierId;
  String hargaId;
  String nama;
  int stok;
  String gambar;

  BarangModel({
    required this.id,
    required this.kategoriId,
    required this.supplierId,
    required this.hargaId,
    required this.nama,
    required this.stok,
    required this.gambar,
  });

  factory BarangModel.fromJson(Map<String, dynamic> json) {
    return BarangModel(
      id: json['id_barang'],
      kategoriId: json['id_kategori'],
      supplierId: json['id_supplier'],
      hargaId: json['id_harga'],
      nama: json['nama'],
      stok: json['stok'],
      gambar: json['gambar_barang'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_barang': id,
      'id_kategori': kategoriId,
      'id_supplier': supplierId,
      'id_harga': hargaId,
      'nama': nama,
      'stok': stok,
      'gambar_barang': gambar,
    };
  }
}
