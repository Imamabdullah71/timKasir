import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WilayahIndonesiaDropdown(),
  ));
}

class WilayahIndonesiaDropdown extends StatefulWidget {
  @override
  _WilayahIndonesiaDropdownState createState() =>
      _WilayahIndonesiaDropdownState();
}

class _WilayahIndonesiaDropdownState extends State<WilayahIndonesiaDropdown> {
  String? selectedProvinsi;
  String? selectedKabupaten;
  String? selectedKecamatan;
  String? selectedKelurahan;

  List<dynamic> provinsiList = [];
  List<dynamic> kabupatenList = [];
  List<dynamic> kecamatanList = [];
  List<dynamic> kelurahanList = [];

  @override
  void initState() {
    super.initState();
    fetchProvinsi(); // Fetch data Provinsi on init
  }

  Future<void> fetchProvinsi() async {
    final response = await http.get(Uri.parse(
        'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json'));
    if (response.statusCode == 200) {
      setState(() {
        provinsiList = jsonDecode(response.body);
      });
    }
  }

  Future<void> fetchKabupaten(String provinsiId) async {
    final response = await http.get(Uri.parse(
        'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/$provinsiId.json'));
    if (response.statusCode == 200) {
      setState(() {
        kabupatenList = jsonDecode(response.body);
      });
    }
  }

  Future<void> fetchKecamatan(String kabupatenId) async {
    final response = await http.get(Uri.parse(
        'https://www.emsifa.com/api-wilayah-indonesia/api/districts/$kabupatenId.json'));
    if (response.statusCode == 200) {
      setState(() {
        kecamatanList = jsonDecode(response.body);
      });
    }
  }

  Future<void> fetchKelurahan(String kecamatanId) async {
    final response = await http.get(Uri.parse(
        'https://www.emsifa.com/api-wilayah-indonesia/api/villages/$kecamatanId.json'));
    if (response.statusCode == 200) {
      setState(() {
        kelurahanList = jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dropdown Search API',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownSearch<dynamic>(
                items: provinsiList,
                dropdownBuilder: (context, item) =>
                    Text(item != null ? item['name'] : ''),
                onChanged: (value) {
                  setState(() {
                    selectedProvinsi = value['id'];
                    selectedKabupaten = null;
                    selectedKecamatan = null;
                    selectedKelurahan = null;
                    kabupatenList = [];
                    kecamatanList = [];
                    kelurahanList = [];
                  });
                  fetchKabupaten(selectedProvinsi!);
                },
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: 'Pilih Provinsi',
                    border: OutlineInputBorder(),
                  ),
                ),
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                  searchFieldProps: TextFieldProps(
                    decoration: InputDecoration(
                      hintText: 'Cari Provinsi...',
                    ),
                  ),
                  itemBuilder: (context, item, isSelected) {
                    // Membuat tampilan item pada popup hanya menampilkan nama
                    return ListTile(
                      title: Text(item['name']),
                      selected: isSelected,
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              if (kabupatenList.isNotEmpty)
                DropdownSearch<dynamic>(
                  items: kabupatenList,
                  dropdownBuilder: (context, item) =>
                      Text(item != null ? item['name'] : ''),
                  onChanged: (value) {
                    setState(() {
                      selectedKabupaten = value['id'];
                      selectedKecamatan = null;
                      selectedKelurahan = null;
                      kecamatanList = [];
                      kelurahanList = [];
                    });
                    fetchKecamatan(selectedKabupaten!);
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Pilih Kabupaten',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: 'Cari Kabupaten...',
                      ),
                    ),
                    itemBuilder: (context, item, isSelected) {
                      // Membuat tampilan item pada popup hanya menampilkan nama
                      return ListTile(
                        title: Text(item['name']),
                        selected: isSelected,
                      );
                    },
                  ),
                ),
              SizedBox(height: 20),
              if (kecamatanList.isNotEmpty)
                DropdownSearch<dynamic>(
                  items: kecamatanList,
                  dropdownBuilder: (context, item) =>
                      Text(item != null ? item['name'] : ''),
                  onChanged: (value) {
                    setState(() {
                      selectedKecamatan = value['id'];
                      selectedKelurahan = null;
                      kelurahanList = [];
                    });
                    fetchKelurahan(selectedKecamatan!);
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Pilih Kecamatan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: 'Cari Kecamatan...',
                      ),
                    ),
                    itemBuilder: (context, item, isSelected) {
                      // Membuat tampilan item pada popup hanya menampilkan nama
                      return ListTile(
                        title: Text(item['name']),
                        selected: isSelected,
                      );
                    },
                  ),
                ),
              SizedBox(height: 20),
              if (kelurahanList.isNotEmpty)
                DropdownSearch<dynamic>(
                  items: kelurahanList,
                  dropdownBuilder: (context, item) {
                    // Mengembalikan widget Text dengan nama item
                    return Text(item != null ? item['name'] : '');
                  },
                  onChanged: (value) {
                    // Mengubah state saat item dipilih
                    setState(() {
                      selectedKelurahan = value['id'];
                    });
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: 'Pilih Kelurahan',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  popupProps: PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        hintText: 'Cari Kelurahan...',
                      ),
                    ),
                    itemBuilder: (context, item, isSelected) {
                      // Membuat tampilan item pada popup hanya menampilkan nama
                      return ListTile(
                        title: Text(item['name']),
                        selected: isSelected,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
