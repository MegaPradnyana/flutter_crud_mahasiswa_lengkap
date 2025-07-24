import 'package:flutter/material.dart';
import '../model/mahasiswa.dart';

class DetailMahasiswaScreen extends StatelessWidget {
  final Mahasiswa mahasiswa;
  DetailMahasiswaScreen(this.mahasiswa);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${mahasiswa.nama}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('NIM: ${mahasiswa.nim}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Jurusan: ${mahasiswa.jurusan}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}