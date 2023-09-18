import 'package:go_router/go_router.dart';
import 'package:project_manajement_cuti/screens/ajukan_cuti/ajukan_cuti_screen.dart';
import 'package:project_manajement_cuti/screens/cuti_dianjukan/cuti_diajukan_screen.dart';
import 'package:project_manajement_cuti/screens/home/home_screen.dart';
import 'package:project_manajement_cuti/screens/kuota_cuti/kuota_cuti_screen.dart';
import 'package:project_manajement_cuti/screens/list_cuti/list_cuti_screen.dart';
import 'package:project_manajement_cuti/screens/profil/profil_screen.dart';

part 'go_router.dart';

class AppRoute {
  static String home = 'home';
  static String listCuti = 'list-cuti';
  static String ajukanCuti = 'ajukan-cuti';
  static String kuotaCuti = 'kuota-cuti';
  static String profil = 'profil';
  static String cutiDiajukan = 'cuti-diajukan';
}
