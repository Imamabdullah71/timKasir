import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Kontruksi extends StatefulWidget {
    @override
    _KontruksiState createState() => _KontruksiState();
}

class _KontruksiState extends State<Kontruksi> {
    final faker = Faker();
    bool _isInitialized = false;
    final PageController _pageController = PageController();
    int indexSekarang = 0;

    @override
    void initState() {
        super.initState();
        // Inisialisasi data lokal untuk bahasa Indonesia
        initializeDateFormatting('id_ID', null).then((_) {
            setState(() {
                _isInitialized = true;
            });
        });
    }

    @override
    void dispose() {
        _pageController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        if (!_isInitialized) {
            return Scaffold(
                appBar: AppBar(
                    title: Text("Date Format"),
                    backgroundColor: Colors.red,
                    centerTitle: true,
                ),
                body: Center(
                    child: CircularProgressIndicator(),
                ),
            );
        }

        List<Widget> widgets = [
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage("https://picsum.photos/id/${870 + index}/200/300"),
                        backgroundColor: Colors.grey[300],
                    ),
                    title: Text(faker.person.name()),
                    subtitle: Text(
                        DateFormat('EEEE, d MMMM y', 'id_ID').format(DateTime.now())),
                ),
            ),
            Center(
                child: Text(
                    "Menu ke - 2",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
            ),
            Center(
                child: Text(
                    "Menu ke - 3",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
            ),
            Center(
                child: Text(
                    "Menu ke - 4",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
            ),
            Center(
                child: Text(
                    "Menu ke - 5",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
            ),
        ];

        return Scaffold(
            appBar: AppBar(
                title: Text("Date Format"),
                backgroundColor: Colors.red,
                centerTitle: true,
            ),
            body: PageView(
                controller: _pageController,
                onPageChanged: (int index) {
                    // Perbarui indexSekarang saat halaman berubah
                    setState(() {
                        indexSekarang = index;
                    });
                },
                children: widgets,
            ),
            bottomNavigationBar: ConvexAppBar(
                items: [
                    TabItem(icon: Icons.home, title: 'Home'),
                    TabItem(icon: Icons.map, title: 'Discovery'),
                    TabItem(icon: Icons.add, title: 'Add'),
                    TabItem(icon: Icons.message, title: 'Message'),
                    TabItem(icon: Icons.people, title: 'Profile'),
                ],
                initialActiveIndex: indexSekarang,
                onTap: (int i) {
                    // Animasi ke halaman yang dipilih
                    _pageController.animateToPage(
                        i,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                    );
                    // Perbarui indexSekarang
                    setState(() {
                        indexSekarang = i;
                    });
                },
            ),
        );
    }
}
