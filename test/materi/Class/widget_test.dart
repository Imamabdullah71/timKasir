import 'pakaian.dart';

void main() {
  var pakaian1 = Pakaian(warna: "Biru", jenis: "Baju", ukuran: "M");
  print(
      "${pakaian1.jenis} - Warna ${pakaian1.warna}, Ukuran ${pakaian1.ukuran}");
  print("Ganti Ukuran");
  // pakaian1.ukuran = "L"; --> Tidak diizinkan mengganti private atribute
  pakaian1.setukuran = "XXL";
  print(
      "${pakaian1.jenis} - Warna ${pakaian1.warna}, Ukuran ${pakaian1.ukuran}");

  print("\n");

  var pakaian2 = Pakaian(jenis: "Kemeja", ukuran: "XL", warna: "Hitam");
  print(
      "${pakaian2.jenis} - Warna ${pakaian2.warna}, Ukuran ${pakaian2.ukuran}");
}
