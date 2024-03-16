// dibuat secara general -> parent

abstract class Hewan {
  String kategori;
  String nama;
  late int _berat;

  Hewan({
    required int berat,
    required this.nama,
    required this.kategori,
  }) {
    _berat = berat;
  }

  get berat => _berat;

  set makan(int beratMakan) {
    _berat = _berat + beratMakan;
  }

}
