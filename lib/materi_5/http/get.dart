import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  String hasilResponse = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Http post"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 3, 185, 0),
              foregroundColor: Colors.white,
            ),
            onPressed: () async {
              var myresponse = await http.post(
                Uri.parse("https://reqres.in/api/users"),
                body: {"name": nameC.text, "job": jobC.text},
              );
              Map<String, dynamic> mydata =
                  jsonDecode(myresponse.body) as Map<String, dynamic>;

              setState(() {
                hasilResponse = "name = ${mydata['name']}, job = ${mydata['job']}, dibuat = ${mydata['createdAt']}";
              });
            },
            child: Text("Submit"),
          ),
          SizedBox(height: 50),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: 10),
          Text(hasilResponse),
        ],
      ),
    );
  }
}
