import 'package:flutter/material.dart';
import '../model/mahasiswa.dart';
import '../db/mahasiswa_db.dart';

class MahasiswaProvider extends ChangeNotifier {
  List<Mahasiswa> _list = [];
  List<Mahasiswa> get mahasiswaList => _list;

  String _searchQuery = '';
  String _filterJurusan = 'Semua';

  Future<void> loadData() async {
    final data = await MahasiswaDB.getAllMahasiswa();
    _list = data;
    applyFilter();
  }

  void tambah(Mahasiswa m) async {
    await MahasiswaDB.insertMahasiswa(m);
    await loadData();
  }

  void edit(Mahasiswa m) async {
    await MahasiswaDB.updateMahasiswa(m);
    await loadData();
  }

  void hapusMahasiswa(int id) async {
    await MahasiswaDB.deleteMahasiswa(id);
    await loadData();
  }

  void search(String query) {
    _searchQuery = query.toLowerCase();
    applyFilter();
  }

  void filterByJurusan(String jurusan) {
    _filterJurusan = jurusan;
    applyFilter();
  }

  void applyFilter() async {
    var data = await MahasiswaDB.getAllMahasiswa();
    if (_filterJurusan != 'Semua') {
      data = data.where((m) => m.jurusan == _filterJurusan).toList();
    }
    if (_searchQuery.isNotEmpty) {
      data = data.where((m) => m.nama.toLowerCase().contains(_searchQuery)).toList();
    }
    _list = data;
    notifyListeners();
  }
}