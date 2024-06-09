import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dropdown_search/dropdown_search.dart';

// ignore: use_key_in_widget_constructors, camel_case_types
class tambahBarang extends StatelessWidget {
  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Barang".toUpperCase(),
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(BootstrapIcons.house),
            onPressed: () {
              Get.offAllNamed("/halaman_utama");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.photo_library,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.photo_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Nama*",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 8, 8, 8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Nama Barang',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Colors.purple,
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
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Stok",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 8, 8, 8),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
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
                                          const BorderRadius.all(Radius.circular(30)),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Kode",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 8, 8, 8),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
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
                                          const BorderRadius.all(Radius.circular(30)),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 25),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(BootstrapIcons.upc_scan),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Harga dasar",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 8, 8, 8),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                        'assets/images/icon_image/rp.png',
                                        width: 5,
                                        height: 5,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
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
                                          const BorderRadius.all(Radius.circular(30)),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Harga Jual",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 8, 8, 8),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image.asset(
                                        'assets/images/icon_image/rp.png',
                                        width: 5,
                                        height: 5,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
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
                                          const BorderRadius.all(Radius.circular(30)),
                                    ),
                                    contentPadding: const EdgeInsets.only(left: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    //Container Sengaja dibuat untuk mengatur ukuran dari DropdownSearch
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownSearch<String>(
                            dropdownButtonProps: const DropdownButtonProps(
                              icon: Icon(Icons.keyboard_arrow_down_outlined),
                            ),
                            dropdownDecoratorProps: const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: 'Kategori',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                ),
                              ),
                            ),
                            items: const ["Brazil", "Italia", "Tunisia", 'Canada'],
                            popupProps: const PopupPropsMultiSelection.menu(
                              showSelectedItems: true,
                              // disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            onChanged: print,
                            // selectedItems: ["Brazil"],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            BootstrapIcons.plus_lg,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => isExpanded.value
                        ? Column(
                            children: [
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Nama Barang',
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
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
                                        const BorderRadius.all(Radius.circular(30)),
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 20),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Nama Barang',
                                  border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
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
                                        const BorderRadius.all(Radius.circular(30)),
                                  ),
                                  contentPadding: const EdgeInsets.only(left: 20),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          )
                        : const SizedBox(height: 5),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        isExpanded.toggle();
                        
                      },
                      child: Obx(
                        () {
                          return Text.rich(
                            TextSpan(
                              text: isExpanded.value
                                  ? 'Tampilkan lebih sedikit'
                                  : 'Tampilkan lebih detail',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

