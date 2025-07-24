import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/mahasiswa.dart';
import '../provider/mahasiswa_provider.dart';

class EditMahasiswaScreen extends StatefulWidget {
  final Mahasiswa mahasiswa;
  EditMahasiswaScreen(this.mahasiswa);

  @override
  State<EditMahasiswaScreen> createState() => _EditMahasiswaScreenState();
}

class _EditMahasiswaScreenState extends State<EditMahasiswaScreen> {
  late TextEditingController _namaController;
  late TextEditingController _nimController;
  late TextEditingController _jurusanController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.mahasiswa.nama);
    _nimController = TextEditingController(text: widget.mahasiswa.nim);
    _jurusanController = TextEditingController(text: widget.mahasiswa.jurusan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Mahasiswa')),
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
                  id: widget.mahasiswa.id,
                  nama: _namaController.text,
                  nim: _nimController.text,
                  jurusan: _jurusanController.text,
                );
                Provider.of<MahasiswaProvider>(context, listen: false).edit(m);
                Navigator.pop(context);
              },
              child: Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}