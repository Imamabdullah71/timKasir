import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:timkasirapp/Filter_Test/Query_Controller.dart';

class QueryView extends GetView<QueryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(
              50, // Lebar
              48, // Tinggi
            ),
          ),
          onPressed: () {
            controller.filter();
          },
          child: Text("Filter"),
        ),
      ),
    );
  }
}
