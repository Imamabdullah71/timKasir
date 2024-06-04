import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:timkasirapp/upload_file/upload_controller.dart';

class UploadPage extends GetView<UploadController> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Page"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.uploadFile();
          },
          child: Text("Upload"),
        ),
      ),
    );
  }
}
