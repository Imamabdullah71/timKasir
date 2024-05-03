import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(Depend());
}

class Depend extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}

class IntroductionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of introduction page 1",
          body: "Welcome to the app! This is a description of how it works.",
          image:  Center(
            child: Lottie.asset("assets/lotties/payment_chart.json", repeat: true),
          ),
        ),
        PageViewModel(
          title: "Title of introduction page 2",
          body: "Welcome to the app! This is a description of how it works.",
          image:  Center(
            child: Icon(Icons.waving_hand, size: 50.0),
          ),
        ),
      ],
      showNextButton: false,
      done:  Text("Done"),
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Might(),
          ),
        );
      },
    );
  }
}

class Might extends StatefulWidget {

  @override
  State<Might> createState() => _MightState();
}

class _MightState extends State<Might> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Introduction Screen",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 100, 232, 250),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search, // Gantilah dengan ikon yang Anda inginkan
              color: Colors.white, // Warna ikon
              size: 30.0, // Ukuran ikon
            ),
            onPressed: () {
              // Tambahkan aksi yang diinginkan saat ikon diklik
              print('Ikon search diklik');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.notifications, // Gantilah dengan ikon yang Anda inginkan
              color: Colors.white, // Warna ikon
              size: 30.0, // Ukuran ikon
            ),
            onPressed: () {
              // Tambahkan aksi yang diinginkan saat ikon diklik
              print('Ikon notifications diklik');
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "Hello",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
