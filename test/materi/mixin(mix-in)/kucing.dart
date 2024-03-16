import 'hewan.dart';
import 'mixin/lari.dart';

class Kucing extends Hewan with Lari {
  int jumlahKaki;

  Kucing({
    required this.jumlahKaki,
    required super.berat,
  }) : super(
          nama: "Kucing",
          kategori: "Mamalia",
        );
}
