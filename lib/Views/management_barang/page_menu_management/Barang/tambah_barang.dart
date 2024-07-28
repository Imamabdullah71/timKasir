// tambah_barang.dart
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tim_kasir/Controllers/Barang_Controller/tambah_barang_controller.dart';

// ignore: use_key_in_widget_constructors
class TambahBarangPage extends StatelessWidget {
  final TambahBarangController controller = Get.put(TambahBarangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Mengatur warna ikon back
        ),
        title: const Text(
          "Tambah Barang",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 114, 94, 225),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
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
                        child: const Icon(
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
                        icon: const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.pickImage(ImageSource.gallery);
                        },
                        icon: const Icon(
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
              onChanged: (value) => controller.setField('nama_barang', value),
              decoration: InputDecoration(
                labelText: 'Nama Barang',
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 114, 94, 225),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                contentPadding: const EdgeInsets.only(left: 20),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextField(
                      onChanged: (value) =>
                          controller.setField('harga_beli', value),
                      decoration: InputDecoration(
                        labelText: 'Harga Beli',
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 114, 94, 225),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade500,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        contentPadding: const EdgeInsets.only(left: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextField(
                      onChanged: (value) =>
                          controller.setField('harga_jual', value),
                      decoration: InputDecoration(
                        labelText: 'Harga Jual',
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 114, 94, 225),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade500,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        contentPadding: const EdgeInsets.only(left: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextField(
                      onChanged: (value) =>
                          controller.setField('stok_barang', value),
                      decoration: InputDecoration(
                        labelText: 'Stok',
                        filled: true,
                        fillColor: Colors.white,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 114, 94, 225),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade500,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                        ),
                        contentPadding: const EdgeInsets.only(left: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            controller.setField('kode_barang', value),
                        controller: TextEditingController(
                          text: controller.barcode.value,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Kode Barang',
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 114, 94, 225),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          contentPadding: const EdgeInsets.only(left: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await scanBarcode();
                  },
                  icon: const Icon(BootstrapIcons.upc_scan),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Obx(() {
                    return DropdownSearch<String>(
                      items: controller.kategoriList
                          .map(
                              (kategori) => kategori['nama_kategori'] as String)
                          .toList(),
                      selectedItem: controller.selectedKategori.value,
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Pilih Kategori",
                          filled: true,
                          fillColor: Colors.white, // Warna background
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Radius border untuk sudut yang lebih lembut
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(
                                  255, 114, 94, 225), // Warna border saat fokus
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.grey
                                  .shade500, // Warna border saat tidak fokus
                            ),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        var selectedKategori = controller.kategoriList
                            .firstWhere((kategori) =>
                                kategori['nama_kategori'] == value);
                        controller.setKategori(
                            selectedKategori['nama_kategori'],
                            selectedKategori['id']);
                      },
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                          decoration: InputDecoration(
                            labelText: "Cari Kategori",
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        fit: FlexFit.loose,
                        constraints: BoxConstraints.tightFor(
                            width: MediaQuery.of(context).size.width *
                                0.8), // Mengatur ukuran popup dropdown
                      ),
                    );
                  }),
                ),
                IconButton(
                    onPressed: () => Get.toNamed("/kategori_page"),
                    icon: const Icon(BootstrapIcons.plus_lg))
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 114, 94, 225),
            minimumSize: const Size(
              double.infinity, // Lebar
              48, // Tinggi
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          onPressed: () {
            controller.tambahBarang();
          },
          child: const Text(
            "Tambahkan Barang",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
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
