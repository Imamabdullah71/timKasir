
// Null Safety -> fitur untuk mengetahui adanya error akibat null
// ada 3 jenis syntax baru :
// ? ! late

// versi null safety -> >= 2.12

// Kesimpulan :
// 1. jika Variable ada "?" maka variable diperbolehkan null
// 2. jika Variable ada "??" untuk handle null
// 3. Jika Variable ada "!" Kita sudah memastikan dengan YAKIN bahwa data sudah pasti ada (tidak null) | Pastikan sudah ada handle null
// 4. Menggunakan late sebelum Variable contoh "late String? nama", akan dipastikan oleh "late" bahwa var "nama" itu kosong (tidak ada data)

void main() {
  String? nama = getNama();

  // print(nama?.length ?? "Tidak ada Data Nama"); <<-- Fungsi ini sama dengan fungsi if else dibawah, lebih simple tetapi tidak variatif

  if (nama?.length == null) {
    // Menghandle data null
    print("Tidak ada Data Nama");
  } else {
    // sudah dipastikan ada datanya
    print("$nama terdiri dari ${nama!.length} karakter");
  }
}

String? getNama() {
  return "Jumandi";
}
