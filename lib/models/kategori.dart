class KategoriModel {
  String id;
  String namaKategori;

  KategoriModel({
    required this.id,
    required this.namaKategori,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
      id: json['id_kategori'],
      namaKategori: json['nama_kategori'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_kategori': id,
      'nama_kategori': namaKategori,
    };
  }
}
