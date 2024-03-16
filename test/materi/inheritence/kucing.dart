import 'hewan.dart';

class Kucing extends Hewan {
  int jumlahKaki;
  int? kecepatanLari;

  Kucing({
    required this.jumlahKaki,
    this.kecepatanLari,
    required super.berat,
  }) : super(
          nama: "Kucing",
          kategori: "Mamalia",
        );
}
