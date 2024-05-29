import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timkasirapp/models/infaq.dart';


class InfaqController extends GetxController {
  var infaqList = <InfaqModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchInfaq();
  }

  void fetchInfaq() {
    FirebaseFirestore.instance.collection('Infaq').snapshots().listen((snapshot) {
      infaqList.value = snapshot.docs.map((doc) => InfaqModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
    });
  }

  void addInfaq(InfaqModel infaq) {
    FirebaseFirestore.instance.collection('Infaq').add(infaq.toJson()).then((doc) {
      infaq.id = doc.id;
      infaqList.add(infaq);
    }).catchError((error) {
      print("Failed to add infaq: $error");
    });
  }
}
