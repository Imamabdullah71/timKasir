import 'package:flutter/material.dart';
import 'package:faker/faker.dart';


class Kontruksi extends StatelessWidget {
    var faker = new Faker();


  @override
  Widget build(BuildContext context) {

    print(faker.person.name());

    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/id/${870 + index}/200/300"),
            backgroundColor: Colors.grey[300],
          ),
          title: Text(faker.person.name()),
          subtitle: Text(faker.internet.email()),
        ),
      ),
    );
  }
}

