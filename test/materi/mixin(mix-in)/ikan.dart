import 'hewan.dart';
import 'mixin/renang.dart';

class Ikan extends Hewan with Renang {
  Ikan({
    required super.berat,
  }) : super(
          nama: "Ikan",
          kategori: "Hewan Air",
        );
}
