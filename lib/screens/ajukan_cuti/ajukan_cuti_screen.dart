import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:project_manajement_cuti/models/cuti_model.dart';
import 'package:project_manajement_cuti/providers/cuti_provider.dart';
import 'package:project_manajement_cuti/providers/kuota_cuti_provider.dart';
import 'package:project_manajement_cuti/screens/cuti_dianjukan/cuti_diajukan_screen.dart';
import 'package:provider/provider.dart';

class AjukanCutiScreen extends StatefulWidget {
  const AjukanCutiScreen({super.key});

  @override
  State<AjukanCutiScreen> createState() => _AjukanCutiScreenState();
}

class _AjukanCutiScreenState extends State<AjukanCutiScreen> {
  final alasanCutiController = TextEditingController();
  final tanggalCutiController = TextEditingController();
  List<DateTime> dates = [];
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    //penamaaan variabel tidak bisa huruf besar pertamanya
    final cutiDiajukanProvider =
        Provider.of<CutiDiajukanProvider>(context, listen: true);
    final kuotaCutiProvider = Provider.of<KuotaCutiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajukan Cuti'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              TextField(
                controller: alasanCutiController,
                decoration: const InputDecoration(
                  label: Text("Alasan Cuti"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(),
                value: dates,
                onValueChanged: (value) =>
                    selectedDate = value[0] ?? DateTime.now(),
              ),
              SizedBox(
                width: maxWidth * 0.9,
                child: ElevatedButton(
                  onPressed: () async {
                    // inisial data
                    final alasanCuti = alasanCutiController.text;
                    final tanggal = selectedDate.toLocal().toString();
                    // generate id
                    final id = Random().nextInt(999);

                    // simpan data distate manajemen
                    cutiDiajukanProvider.addData(
                      CutiModel(
                          id: id, alasanCuti: alasanCuti, tanggal: tanggal),
                    );

                    // tambah kuota cuti
                    kuotaCutiProvider.incrementCutiTerpakai();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CutiDiajukanScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white),
                  child: const Text('Ajukan'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
