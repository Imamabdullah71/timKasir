import 'hewan.dart';

class Burung extends Hewan {
  int jumlahKaki;
  int? kecepatanTerbang;

  Burung({
    required this.jumlahKaki,
    this.kecepatanTerbang,
    required super.berat,
  }) : super(
          nama: "Burung",
          kategori: "Hewan Udara",
        );
}
