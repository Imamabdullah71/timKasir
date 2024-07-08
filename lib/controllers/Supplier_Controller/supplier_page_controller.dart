import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tim_kasir/models/supplier_model.dart';

class SupplierController extends GetxController {
  var suppliers = <Supplier>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSuppliers();
  }

  void fetchSuppliers() async {
    // Referensi ke collection Firestore
    var collection = FirebaseFirestore.instance.collection('supplier');
    var querySnapshot = await collection.get();

    // Map data dari Firestore ke dalam model Supplier
    suppliers.value = querySnapshot.docs.map((doc) {
      return Supplier.fromDocument(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }
}
