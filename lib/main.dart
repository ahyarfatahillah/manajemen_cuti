import 'package:flutter/material.dart';
import 'package:project_manajement_cuti/providers/cuti_provider.dart';
import 'package:project_manajement_cuti/providers/kuota_cuti_provider.dart';
import 'package:project_manajement_cuti/providers/list_cuti_provider.dart';
import 'package:project_manajement_cuti/providers/profil_provider.dart';
import 'package:project_manajement_cuti/routes/app_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CutiDiajukanProvider()),
        ChangeNotifierProvider(create: (context) => ProfilProvider()),
        ChangeNotifierProvider(create: (context) => KuotaCutiProvider()),
        ChangeNotifierProvider(create: (context) => ListCutiProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Manajement Cuti',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: HomeScreen(),
        routerConfig: goRouter,
      ),
    );
  }
}
