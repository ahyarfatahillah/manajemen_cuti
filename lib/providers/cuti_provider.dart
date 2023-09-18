import 'package:flutter/material.dart';
import 'package:project_manajement_cuti/models/cuti_model.dart';

class CutiDiajukanProvider extends ChangeNotifier {
  List<CutiModel> _data = [];
  List<CutiModel> get data => _data;
  // method
  void addData(CutiModel newData) {
    _data.add(newData);
    notifyListeners();
  }

  void deleteData(int index) {
    final item = _data.firstWhere((item) => item.id == index);
    _data.remove(item);
    notifyListeners();
  }
}
