import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../materi_5/future_Builder_with_model/models/user.dart';

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
  List<UserModel> allUser = [];

  Future getAllUser() async {
    try {
      var myresponse = await http.get(Uri.parse("https://reqres.in/api/users"));
      List myData =
          (jsonDecode(myresponse.body) as Map<String, dynamic>)["data"];
      myData.forEach((element) {
        allUser.add(UserModel.fromJson(element));
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
              if (allUser.length == 0) {
                return Center(
                  child: Text("Tidak ada Data"),
                );
              }
              return ListView.builder(
                itemCount: allUser.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 230, 230, 230),
                    backgroundImage: NetworkImage(allUser[index].avatar),
                  ),
                  title: Text("${allUser[index].firstName} ${allUser[index].lastName}"),
                  subtitle: Text("${allUser[index].email}"),
                ),
              );
            }
          }),
    );
  }
}
