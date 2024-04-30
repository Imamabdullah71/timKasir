import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:timkasir/Materi%203/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String myData = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Delete"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(
            onPressed: () async {
              var myresponse = await http.get(
                Uri.parse("https://reqres.in/api/users/2"),
              );
              Map<String, dynamic> mybody = jsonDecode(myresponse.body);
              setState(() {
                myData =
                    "Nama = ${mybody['data']['first_name']} ${mybody['data']['last_name']}";
              });
            },
            icon: Icon(Icons.get_app_sharp),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(myData),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              var myresponse = await http.delete(
                Uri.parse("https://reqres.in/api/users/2"),
              );
              if (myresponse.statusCode == 204) {
                setState(() {
                  myData = "Data berahasil dihapus";
                });
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.restore_from_trash),
                SizedBox(width: 5),
                Text("Hapus Data"),
              ],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
