import './kucing.dart';
import './burung.dart';
import './ikan.dart';

void main() {
  Kucing hewan1 = Kucing(jumlahKaki: 4, berat: 10, kecepatanLari: 5);

  print("Hewan 1 : ${hewan1.kategori} - ${hewan1.nama}");
  print("${hewan1.berat} Kg");
  print("Jumlah Kaki ${hewan1.jumlahKaki} Kaki");
  print("------------Makan------------");
  hewan1.makan = 1;
  print("Sekarang ${hewan1.berat} Kg");

  print("\n==============\n");

  Ikan hewan2 = Ikan(berat: 2, kecepatanRenang: 3);
  print("Hewan 2 : ${hewan2.kategori} - ${hewan2.nama}");
  print("${hewan2.berat} Kg");
  print("Kecepatan Renang : ${hewan2.kecepatanRenang} m/s");
  print("------------Makan------------");
  hewan2.makan = 1;
  print("Sekarang ${hewan2.berat} Kg");

  print("\n==============\n");

  Burung hewan3 = Burung(jumlahKaki: 2, berat: 6, kecepatanTerbang: 10);
  print("Hewan 3 : ${hewan3.kategori} - ${hewan3.nama}");
  print("${hewan3.berat} Kg");
  print("Kecepatan Terbang : ${hewan3.kecepatanTerbang} m/s");
  hewan3.makan = 5;
  print("------------Makan------------");
  print("Sekarang ${hewan3.berat} Kg");

  print("\n==============\n");
}
