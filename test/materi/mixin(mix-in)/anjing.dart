import 'hewan.dart';
import './mixin/renang.dart';
import 'mixin/lari.dart';

class Anjing extends Hewan with Renang, Lari {
  int jumlahKaki;

  Anjing({
    required this.jumlahKaki,
    required super.berat,
  }) : super(
          nama: "Anjing",
          kategori: "Mamalia",
        );
}
