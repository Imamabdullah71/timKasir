import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String id;
  late String email;
  late String name;

  @override
  void initState() {
    id = "";
    email = "";
    name = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 11, 174, 255),
        title: Text("HTTP Get"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ID : $id",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Email : $email",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Name : $name",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                var myresponse = await myhttp.get(
                  Uri.parse("https://reqres.in/api/users/2"),
                );
                if (myresponse.statusCode == 200) {
                  // Berhasil get data ketika statusCode 200
                  Map<String, dynamic> data =
                      jsonDecode(myresponse.body) as Map<String, dynamic>;
                  print(data["data"]);
                  setState(() {
                    id = data["data"]["id"].toString();
                    email = data["data"]["email"].toString();
                    name = "${data["data"]["first_name"]} ${data["data"]["last_name"]}";
                  });
                } else {
                  // Tidak berhasil get data
                  print("Error : ${myresponse.statusCode}");
                  
                }
                print(myresponse.body);
              },
              child: Text("Get Data"),
            ),
          ],
        ),
      ),
    );
  }
}
