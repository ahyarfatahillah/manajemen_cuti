import 'package:flutter/material.dart';
import 'package:project_manajement_cuti/models/profil_model.dart';
import 'package:project_manajement_cuti/providers/profil_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final namaPenggunaController = TextEditingController();
  final namaInstansiController = TextEditingController();
  final namaEmailController = TextEditingController();
  final nomorTelpController = TextEditingController();

  _ambilDataDariStorege() async {
    //call instance
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    namaPenggunaController.text = prefs.getString('namaPengguna') ?? '';
    namaInstansiController.text = prefs.getString('instansi') ?? '';
    namaEmailController.text = prefs.getString('email') ?? '';
    nomorTelpController.text = prefs.getString('telp') ?? '';
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
    // panggil Profider
    final profilProvider = Provider.of<ProfilProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              TextField(
                controller: namaPenggunaController,
                decoration: const InputDecoration(
                  label: Text("Nama Pengguna"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: namaInstansiController,
                decoration: const InputDecoration(
                  label: Text("Instansi"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: namaEmailController,
                decoration: const InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: nomorTelpController,
                decoration: const InputDecoration(
                  label: Text("Tlp"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // const Spacer(),
              SizedBox(
                width: maxWidth * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    final namaPengguna = namaPenggunaController.text;
                    final instansi = namaInstansiController.text;
                    final email = namaEmailController.text;
                    final tlp = nomorTelpController.text;

                    //call instance
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    // store data
                    await prefs.setString("namaPengguna", namaPengguna);
                    await prefs.setString("instansi", instansi);
                    await prefs.setString("email", email);
                    await prefs.setString("telp", tlp);
                    // simpan data ke state manajemen
                    profilProvider.setData(
                      ProfilModel(
                        namapengguna: namaPengguna,
                        instansi: instansi,
                        email: email,
                        tlp: tlp,
                      ),
                    );
                    // pindah ke halama home
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Simpan",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
