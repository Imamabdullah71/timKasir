import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timkasirapp/models/infaq.dart';
import 'Controllers/infaq_controller.dart';

class InfaqScreen extends StatelessWidget {
  final InfaqController infaqController = Get.put(InfaqController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pelaporan Infaq'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: infaqController.infaqList.length,
                itemBuilder: (context, index) {
                  var infaq = infaqController.infaqList[index];
                  return ListTile(
                    title: Text(infaq.description),
                    subtitle: Text('Rp${infaq.amount.toString()} - ${infaq.date.toLocal()}'),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InfaqForm(),
          ),
        ],
      ),
    );
  }
}

class InfaqForm extends StatelessWidget {
  final InfaqController infaqController = Get.find();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: descriptionController,
          decoration: InputDecoration(labelText: 'Deskripsi'),
        ),
        TextField(
          controller: amountController,
          decoration: InputDecoration(labelText: 'Jumlah'),
          keyboardType: TextInputType.number,
        ),
        ElevatedButton(
          onPressed: () {
            var infaq = InfaqModel(
              id: '',
              userId: 'exampleUserId',  // Ganti dengan ID pengguna yang sesuai
              date: DateTime.now(),
              amount: double.parse(amountController.text),
              description: descriptionController.text,
            );
            infaqController.addInfaq(infaq);
          },
          child: Text('Tambah Infaq'),
        ),
      ],
    );
  }
}
