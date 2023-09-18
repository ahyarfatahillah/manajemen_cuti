import 'package:flutter/material.dart';

class CutiCard extends StatelessWidget {
  const CutiCard({
    super.key,
    required this.title,
    required this.value,
  });
  // parameter
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 180,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Hari",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
