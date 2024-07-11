class Supplier {
  String id;
  String nama;
  String namaTokoSupplier;
  String email;
  String noTelepon;
  String alamat;

  Supplier({
    required this.id,
    required this.nama,
    required this.namaTokoSupplier,
    required this.email,
    required this.noTelepon,
    required this.alamat,
  });

  // Factory method to create Supplier from Firestore document
  factory Supplier.fromDocument(Map<String, dynamic> doc, String id) {
    return Supplier(
      id: id,
      nama: doc['nama'],
      namaTokoSupplier: doc['nama_toko_supplier'],
      email: doc['email'],
      noTelepon: doc['no_telepon'],
      alamat: doc['alamat'],
    );
  }
}
