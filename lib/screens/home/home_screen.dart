import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_manajement_cuti/providers/profil_provider.dart';
import 'package:project_manajement_cuti/routes/app_route.dart';
import 'package:project_manajement_cuti/screens/profil/profil_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String namaPengguna = '';
  String namaInstansi = "";

  _ambilDataDariStorege() async {
    //call instance
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    namaPengguna = prefs.getString('namaPengguna') ?? '';
    namaInstansi = prefs.getString('instansi') ?? '';
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ambilDataDariStorege();
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;
    // panggil provider
    final profilProvider = Provider.of<ProfilProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Cuti"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilScreen(),
                ),
              );
            },
            icon: const Icon(Icons.person_outline),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('List Cuti'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const ListCutiScreen(),
                //   ),
                // );
                context.goNamed(AppRoute.listCuti);
              },
            ),
            ListTile(
              title: Text('Ajukan Cuti'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const AjukanCutiScreen(),
                //   ),
                // );
                context.goNamed(AppRoute.ajukanCuti);
              },
            ),
            ListTile(
              title: const Text('Kuota Cuti'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const KuotaCutiScreen(),
                //   ),
                // );
                context.goNamed(AppRoute.kuotaCuti);
              },
            ),
            ListTile(
              title: Text('Cuti Diajukan'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const CutiDiajukanScreen(),
                //   ),
                // );
                context.goNamed(AppRoute.cutiDiajukan);
              },
            ),
          ],
        ),
      ),
      body: SizedBox(
        child: Container(
          width: maxWidth,
          height: maxHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Selamat Datang ${profilProvider.data?.namapengguna ?? ''}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Di Aplikasi Manajemen Cuti ${profilProvider.data?.instansi ?? ''}  ",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: maxWidth * 0.6,
                child: OutlinedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const AjukanCutiScreen(),
                    //   ),
                    // );
                    context.goNamed(AppRoute.ajukanCuti);
                  },
                  child: const Text("Ajukan Cuti"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
