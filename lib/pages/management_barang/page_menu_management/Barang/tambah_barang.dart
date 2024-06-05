import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timkasirapp/Controllers/Barang_Controller/tambah_barang_controller.dart';

class TambahBarangPage extends StatelessWidget {
  final TambahBarangController controller = Get.put(TambahBarangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Tambah Barang",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    if (controller.croppedImageFile.value != null) {
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300],
                        ),
                        child: Image.memory(
                          controller.croppedImageFile.value!,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300],
                        ),
                        child: Icon(
                          Icons.image_not_supported,
                          size: 60,
                        ),
                      );
                    }
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.pickImage(ImageSource.camera);
                        },
                        icon: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.pickImage(ImageSource.gallery);
                        },
                        icon: Icon(
                          Icons.image,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              minimumSize: Size(
                double.infinity, // Lebar
                48, // Tinggi
              ),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            onPressed: () {
              controller.tambahBarang();
            },
            child: Text(
              "Tambahkan Barang",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
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
