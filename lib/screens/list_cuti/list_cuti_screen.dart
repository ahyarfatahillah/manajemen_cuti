import 'package:flutter/material.dart';
import 'package:project_manajement_cuti/providers/list_cuti_provider.dart';
import 'package:provider/provider.dart';

class ListCutiScreen extends StatefulWidget {
  const ListCutiScreen({super.key});

  @override
  State<ListCutiScreen> createState() => _ListCutiScreenState();
}

class _ListCutiScreenState extends State<ListCutiScreen> {
  @override
  // kalau mau gambang but init, tulis saja init
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ListCutiProvider>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    final listCutiProvider = Provider.of<ListCutiProvider>(context);
    final data = listCutiProvider.data;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Cuti'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: data.map(
              (item) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(item['tanggal'] ?? '-'),
                      subtitle: Text(item['keterangan'] ?? '-'),
                    ),
                    Divider(),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
