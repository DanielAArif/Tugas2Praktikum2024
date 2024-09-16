import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();
  int? _selectedYear;
  List<int> _years = [];

  @override
  void initState() {
    super.initState();
    // Generate list of years
    int currentYear = DateTime.now().year;
    for (int i = currentYear; i >= 1950; i--) {
      _years.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              _textboxNama(),
              const SizedBox(height: 20),
              _textboxNIM(),
              const SizedBox(height: 20),
              _dropdownTahun(),
              const SizedBox(height: 30),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(Icons.person),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      controller: _namaController,
    );
  }

  _textboxNIM() {
    return TextField(
      decoration: InputDecoration(
        labelText: "NIM",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(Icons.credit_card),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      controller: _nimController,
    );
  }

  _dropdownTahun() {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        labelText: "Tahun Lahir",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      value: _selectedYear,
      items: _years.map((year) {
        return DropdownMenuItem<int>(
          value: year,
          child: Text(year.toString()),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedYear = value;
        });
      },
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent, // Warna tombol
        foregroundColor: Colors.white, // Warna teks
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        String nama = _namaController.text;
        String nim = _nimController.text;
        int tahun = _selectedYear ?? DateTime.now().year;
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                TampilData(nama: nama, nim: nim, tahun: tahun)));
      },
      child: const Text(
        'Simpan',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
