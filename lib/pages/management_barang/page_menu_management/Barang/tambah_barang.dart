import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/tambah_barang_controller.dart';

class TambahBarangPage extends StatelessWidget {
  final TambahBarangController controller = Get.put(TambahBarangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Barang"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nama Barang'),
              onChanged: (value) => controller.setField('nama_barang', value),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Harga Beli'),
              keyboardType: TextInputType.number,
              onChanged: (value) => controller.setField('harga_beli', value),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Harga Jual'),
              keyboardType: TextInputType.number,
              onChanged: (value) => controller.setField('harga_jual', value),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Stok",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 8, 8, 8),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                                controller.setField('stok_barang', value),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Colors.purple,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade500,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              contentPadding: EdgeInsets.only(left: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 2,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Kode Barang",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 8, 8, 8),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: Obx(
                            () => TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) =>
                                  controller.setField('kode_barang', value),
                              controller: TextEditingController(
                                text: controller.barcode.value,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                    color: Colors.purple,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                contentPadding: EdgeInsets.only(left: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  flex: 3,
                ),
                Column(
                  children: [
                    SizedBox(height: 25),
                    IconButton(
                      onPressed: () async {
                        await scanBarcode();
                      },
                      icon: Icon(BootstrapIcons.upc_scan),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Obx(() {
              return DropdownSearch<String>(
                items: controller.kategoriList
                    .map((kategori) => kategori['nama_kategori'] as String)
                    .toList(),
                selectedItem: controller.selectedKategori.value,
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: "Pilih Kategori",
                  ),
                ),
                onChanged: (value) {
                  var selectedKategori = controller.kategoriList.firstWhere(
                      (kategori) => kategori['nama_kategori'] == value);
                  controller.setKategori(selectedKategori['nama_kategori'],
                      selectedKategori['id']);
                },
                popupProps: PopupProps.menu(
                  showSearchBox: true,
                ),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.tambahBarang();
              },
              child: Text("Tambah Barang"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // Warna garis untuk scanning
      'Cancel', // Teks tombol batal
      true, // Apakah harus menampilkan flash kamera
      ScanMode.BARCODE, // Mode scan (BARCODE atau QR)
    );

    if (barcodeScanRes != '-1') {
      controller.setBarcode(barcodeScanRes);
    }
  }
}
