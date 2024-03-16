import 'hewan.dart';

class Ikan extends Hewan {
  int? kecepatanRenang;

  Ikan({
    this.kecepatanRenang,
    required super.berat,
  }) : super(
          nama: "Ikan",
          kategori: "Hewan Air",
        );
}
