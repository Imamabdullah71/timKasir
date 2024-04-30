import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

/*
Format lengkap untuk Date Format
  - y: Tahun lengkap, seperti 2024.
  - yy: Tahun singkat (dua digit), seperti 24.
  - M: Angka bulan tanpa leading zero (1-12), seperti 4 untuk April.
  - MM: Angka bulan dengan leading zero (01-12), seperti 04 untuk April.
  - MMM: Nama bulan singkat, seperti Apr untuk April.
  - MMMM: Nama bulan lengkap, seperti April.
  - d: Angka hari dalam bulan tanpa leading zero (1-31), seperti 7 untuk tanggal 7.
  - dd: Angka hari dalam bulan dengan leading zero (01-31), seperti 07 untuk tanggal 7.
  - EEE: Nama singkat hari dalam seminggu, seperti Sen untuk Senin.
  - EEEE: Nama lengkap hari dalam seminggu, seperti Senin.
  - H: Jam dalam format 24-jam tanpa leading zero (0-23), seperti 8 untuk jam 8 pagi.
  - HH: Jam dalam format 24-jam dengan leading zero (00-23), seperti 08 untuk jam 8 pagi.
  - h: Jam dalam format 12-jam tanpa leading zero (1-12), seperti 8 untuk jam 8 pagi.
  - hh: Jam dalam format 12-jam dengan leading zero (01-12), seperti 08 untuk jam 8 pagi.
  - a: Indikator pagi/sore (AM atau PM).
  - m: Menit tanpa leading zero (0-59), seperti 5.
  - mm: Menit dengan leading zero (00-59), seperti 05.
  - s: Detik tanpa leading zero (0-59), seperti 9.
  - ss: Detik dengan leading zero (00-59), seperti 09.
  - S: Pecahan detik, seperti 3 (untuk milidetik).
*/

class Kontruksi extends StatefulWidget {
    @override
    _KontruksiState createState() => _KontruksiState();
}

class _KontruksiState extends State<Kontruksi> {
    final faker = Faker();
    bool _isInitialized = false;

    @override
    void initState() {
        super.initState();
        // Inisialisasi data lokal untuk bahasa Indonesia
        initializeDateFormatting('id_ID', null).then((_) {
            setState(() {
                _isInitialized = true;
            });
        });
    }

    @override
    Widget build(BuildContext context) {
        if (!_isInitialized) {
            // Tampilkan indikator loading saat inisialisasi belum selesai
            return Scaffold(
                appBar: AppBar(
                    title: Text("Date Format"),
                    backgroundColor: Colors.red,
                    centerTitle: true,
                ),
                body: Center(
                    child: CircularProgressIndicator(),
                ),
            );
        }

        // Inisialisasi selesai, buat UI
        return Scaffold(
            appBar: AppBar(
                title: Text("Date Format"),
                backgroundColor: Colors.red,
                centerTitle: true,
            ),
            body: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage("https://picsum.photos/id/${870 + index}/200/300"),
                        backgroundColor: Colors.grey[300],
                    ),
                    title: Text(faker.person.name()),
                    subtitle: Text(DateFormat('EEEE, d MMMM y', 'id_ID').format(DateTime.now())),
                ),
            ),
        );
    }
}
