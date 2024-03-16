import './kucing.dart';
import './burung.dart';
import './ikan.dart';
import './anjing.dart';

void main() {
  Kucing hewan1 = Kucing(jumlahKaki: 4, berat: 10);
  hewan1.setlari = 9;
  print("Hewan 1 : ${hewan1.kategori} - ${hewan1.nama}");
  print("${hewan1.berat} Kg");
  print("Jumlah Kaki ${hewan1.jumlahKaki} Kaki");
  print("Lari ${hewan1.lari} m/s");
  print("------------Makan------------");
  hewan1.makan = 1;
  print("Sekarang ${hewan1.berat} Kg");

  print("\n==============\n");

  Ikan hewan2 = Ikan(berat: 2);
  hewan2.setrenang = 69;
  print("Hewan 2 : ${hewan2.kategori} - ${hewan2.nama}");
  print("${hewan2.berat} Kg");
  print("Kecepatan Renang : ${hewan2.renang} m/s");
  print("------------Makan------------");
  hewan2.makan = 1;
  print("Sekarang ${hewan2.berat} Kg");

  print("\n==============\n");

  Burung hewan3 = Burung(jumlahKaki: 2, berat: 6);
  hewan3.setterbang = 3;
  print("Hewan 3 : ${hewan3.kategori} - ${hewan3.nama}");
  print("${hewan3.berat} Kg");
  print("Kecepatan Terbang : ${hewan3.terbang} m/s");
  hewan3.makan = 5;
  print("------------Makan------------");
  print("Sekarang ${hewan3.berat} Kg");

  print("\n==============\n");

  Anjing hewan4 = Anjing(jumlahKaki: 4, berat: 10);
  hewan4.setlari = 10;
  hewan4.setrenang = 987;
  print("Hewan 4 : ${hewan4.kategori} - ${hewan4.nama}");
  print("${hewan4.berat} Kg");
  print("Jumlah Kaki ${hewan4.jumlahKaki} Kaki");
  print("Lari ${hewan4.lari} m/s");
  print("Renang ${hewan4.renang} m/s");
  print("------------Makan------------");
  hewan4.makan = 15;
  print("Sekarang ${hewan4.berat} Kg");

  print("\n==============\n");
}
