import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/mahasiswa_provider.dart';
import 'tambah_mahasiswa_screen.dart';
import 'edit_mahasiswa_screen.dart';
import 'detail_mahasiswa_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MahasiswaProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Data Mahasiswa')),
      body: RefreshIndicator(
        onRefresh: () async => await provider.loadData(),
        child: ListView.builder(
          itemCount: provider.mahasiswaList.length,
          itemBuilder: (context, index) {
            final mhs = provider.mahasiswaList[index];
            return ListTile(
              title: Text(mhs.nama),
              subtitle: Text(mhs.nim),
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => DetailMahasiswaScreen(mhs),
              )),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(
                      builder: (_) => EditMahasiswaScreen(mhs),
                    )),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => provider.hapusMahasiswa(mhs.id!),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (_) => TambahMahasiswaScreen(),
        )),
        child: Icon(Icons.add),
      ),
    );
  }
}
