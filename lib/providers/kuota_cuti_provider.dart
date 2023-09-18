import 'package:flutter/material.dart';
import 'package:project_manajement_cuti/models/kuota_cuti_model.dart';

class KuotaCutiProvider extends ChangeNotifier {
  final KuotaCutiModel _data = KuotaCutiModel(
    kuotaCutiTahunan: 14,
    cutiTerpakai: 0,
  );
  KuotaCutiModel get data => _data;

  void incrementCutiTerpakai() {
    _data.cutiTerpakai++;
    notifyListeners();
  }

  void decrementCutiTerpakai() {
    _data.cutiTerpakai--;
    notifyListeners();
  }
}
