class Pakaian {
  // Atribut
  String? jenis;
  String? warna;
  String? _ukuran;

  // Agar Atribut menjadi "private" tambahkan "_", jika tidak ditambahkan maka "Public"

  // CONSTRACTOR

  // Positional Argument
  //   Pakaian(String jenisNya, String warnaNya) {
  //     jenis = jenisNya;
  //     warna = warnaNya;
  //   }
  // }

  // Named Argument
  // Pakaian({String? jenisNya, String? warnaNya}) {
  //   jenis = jenisNya;
  //   warna = warnaNya;
  // }

  // Constructor -> direct named constructor
  Pakaian({this.jenis, this.warna, String? ukuran}) {
    _ukuran = ukuran;
  }

  // Method
  // fungsi set biasa
  // void gantiUkuran(String? newUkuran) {
  //   _ukuran = newUkuran;
  // }

  // fungsi get biasa
  // String? ukuran() {
  //   return _ukuran;
  // }

  //getter
  String? get ukuran {
    return _ukuran;
  }

  // setter
  set setukuran(String? newukuran) {
    _ukuran = newukuran;
  }
}
