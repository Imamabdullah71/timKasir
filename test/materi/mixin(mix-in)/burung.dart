import 'hewan.dart';
import 'mixin/terbang.dart';

class Burung extends Hewan with Terbang {
  int jumlahKaki;

  Burung({
    required this.jumlahKaki,
    required super.berat,
  }) : super(
          nama: "Burung",
          kategori: "Hewan Udara",
        );
}
