import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dropdown Search',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Dropdown Search'.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.cyan,
          centerTitle: true,
        ),
        body: CountryDropdown(),
      ),
    );
  }
}

class CountryDropdown extends StatefulWidget {
  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DropdownSearch<String>(
        items: [
          'United States',
          'Canada',
          'Mexico',
          'United Kingdom',
          'Germany',
          'France',
          'Italy',
          'Spain',
          'Australia',
          'Japan',
          'China',
          'India'
          // Anda dapat menambahkan lebih banyak item di sini
        ],
        dropdownDecoratorProps: const DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: 'Select a Country',
            hintText: 'Choose one',
            border: OutlineInputBorder(),
          ),
        ),
        selectedItem: selectedCountry,
        onChanged: (value) {
          print("Yang dipilih : ${value}");
          setState(() {
            selectedCountry = value;
          });
        },
        dropdownButtonProps: const DropdownButtonProps(
          icon: Icon(Icons.arrow_drop_down),
        ),
        popupProps: PopupProps.menu(
          showSearchBox: true,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: 'Search for a country...',
            ),
          ),
        ),
      ),
    );
  }
}
