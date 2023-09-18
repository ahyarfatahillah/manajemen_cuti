import 'package:flutter/material.dart';
import 'package:project_manajement_cuti/models/profil_model.dart';

class ProfilProvider extends ChangeNotifier {
  ProfilModel? _data;
  ProfilModel? get data => _data;

  void setData(ProfilModel data) {
    _data = data;
    notifyListeners();
  }
}
