import 'package:project_manajement_cuti/utils/api.dart';

class ListCutiRepository {
  Future<List> getHariLibur() async {
    final result = await API().client().get(API().baseURL);
    return result.data;
  }
}
