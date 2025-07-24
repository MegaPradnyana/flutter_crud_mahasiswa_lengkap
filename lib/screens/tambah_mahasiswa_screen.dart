import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/mahasiswa.dart';
import '../provider/mahasiswa_provider.dart';

class TambahMahasiswaScreen extends StatelessWidget {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _jurusanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _namaController, decoration: InputDecoration(labelText: 'Nama')),
            TextField(controller: _nimController, decoration: InputDecoration(labelText: 'NIM')),
            TextField(controller: _jurusanController, decoration: InputDecoration(labelText: 'Jurusan')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final m = Mahasiswa(
                  nama: _namaController.text,
                  nim: _nimController.text,
                  jurusan: _jurusanController.text,
                );
                Provider.of<MahasiswaProvider>(context, listen: false).tambah(m);
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            )
          ],
        ),
      ),
    );
  }
}