import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dropdown_search/dropdown_search.dart';

class tambahBarang extends StatelessWidget {
  final RxBool isExpanded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tambah Barang".toUpperCase(),
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(BootstrapIcons.house),
            onPressed: () {
              Get.offAllNamed("/halaman_utama");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                    child: Icon(
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
                        icon: Icon(Icons.camera_alt_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.photo_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama*",
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 8, 8, 8),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Nama Barang',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Colors.purple,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade500,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        contentPadding: EdgeInsets.only(left: 20),
                      ),
                    ),
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
                                  color: const Color.fromARGB(255, 8, 8, 8),
                                ),
                              ),
                              Container(
                                height: 40,
                                child: TextField(
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
                                "Kode",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 8, 8, 8),
                                ),
                              ),
                              Container(
                                height: 40,
                                child: TextField(
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
                        flex: 3,
                      ),
                      Column(
                        children: [
                          SizedBox(height: 25),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(BootstrapIcons.upc_scan),
                          ),
                        ],
                      ),
                    ],
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
                                "Harga dasar",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 8, 8, 8),
                                ),
                              ),
                              Container(
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
                                "Harga Jual",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 8, 8, 8),
                                ),
                              ),
                              Container(
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
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    //Container Sengaja dibuat untuk mengatur ukuran dari DropdownSearch
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownSearch<String>(
                            dropdownButtonProps: DropdownButtonProps(
                              icon: Icon(Icons.keyboard_arrow_down_outlined),
                            ),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                labelText: 'Kategori',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                ),
                              ),
                            ),
                            items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                            popupProps: PopupPropsMultiSelection.menu(
                              showSelectedItems: true,
                              // disabledItemFn: (String s) => s.startsWith('I'),
                            ),
                            onChanged: print,
                            // selectedItems: ["Brazil"],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            BootstrapIcons.plus_lg,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Obx(
                      () => isExpanded.value
                          ? Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Nama Barang',
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
                                SizedBox(height: 20),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Nama Barang',
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
                                SizedBox(height: 20),
                              ],
                            )
                          : SizedBox(height: 5),
                    ),
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
                              style: TextStyle(
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

