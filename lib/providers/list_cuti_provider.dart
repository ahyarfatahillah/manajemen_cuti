import 'package:flutter/material.dart';
import 'package:project_manajement_cuti/data/list_data_repository.dart';

class ListCutiProvider extends ChangeNotifier {
  final List _data = [];
  List get data => _data;

  Future<void> fetch() async {
    final result = await ListCutiRepository().getHariLibur();
    _data.addAll(result);
    notifyListeners();
  }
}
