class Supplier {
  String id;
  String nama;
  String email;
  String noTelepon;
  String alamat;
  String fotoUrl;

  Supplier({
    required this.id,
    required this.nama,
    required this.email,
    required this.noTelepon,
    required this.alamat,
    required this.fotoUrl,
  });

  // Factory method untuk membuat Supplier dari dokumen Firestore
  factory Supplier.fromDocument(Map<String, dynamic> doc, String id) {
    return Supplier(
      id: id,
      nama: doc['nama'],
      email: doc['email'],
      noTelepon: doc['no_telepon'],
      alamat: doc['alamat'],
      fotoUrl: doc['foto_url'],
    );
  }
}
