import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tim_kasir/Controllers/Supplier_Controller/supplier_page_controller.dart';

class SupplierPage extends StatelessWidget {
    final SupplierController controller =
      Get.find<SupplierController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suppliers'),
      ),
      body: Obx(() {
        if (controller.suppliers.isEmpty) {
          return const Center(child: Text('Tidak ada data Supplier'));
        }

        return ListView.builder(
          itemCount: controller.suppliers.length,
          itemBuilder: (context, index) {
            var supplier = controller.suppliers[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(supplier.fotoUrl),
              ),
              title: Text(supplier.nama),
              subtitle: Text(supplier.noTelepon),
            );
          },
        );
      }),
    );
  }
}
