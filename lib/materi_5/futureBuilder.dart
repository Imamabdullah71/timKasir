import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyAppL());
}

class MyAppL extends StatelessWidget {
  const MyAppL({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageF(),
    );
  }
}

class HomePageF extends StatefulWidget {
  const HomePageF({super.key});

  @override
  State<HomePageF> createState() => _HomePageFState();
}

class _HomePageFState extends State<HomePageF> {
  List<Map<String, dynamic>> allUser = [];

  Future getAllUser() async {
    try {
      var myresponse = await http.get(Uri.parse("https://reqres.in/api/users"));
      List myData =
          (jsonDecode(myresponse.body) as Map<String, dynamic>)["data"];
      myData.forEach((element) {
        allUser.add(element);
      });

      print(allUser);

    } catch (e) {
      print("Terjadi Error : ${e}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Future Builder",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getAllUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text("Loading..."),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Terjadi Kesalahan"),
              );
            } else {
              return ListView.builder(
                itemCount: allUser.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 230, 230, 230),
                    backgroundImage: NetworkImage(allUser[index]['avatar']),
                  ),
                  title: Text("${allUser[index]['first_name']} ${allUser[index]['last_name']}"),
                  subtitle: Text("${allUser[index]['email']}"),
                ),
              );
            }
          }),
    );
  }
}
