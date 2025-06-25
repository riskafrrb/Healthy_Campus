import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LihatTokoScreen extends StatelessWidget {
  final int index;

  const LihatTokoScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('tokoMakananBox');
    final data = box.getAt(index);
    final nama = data['nama'] ?? '-';
    final alamat = data['alamat'] ?? '-';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Toko'),
        backgroundColor: const Color(0xFF5C8858),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nama Toko:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              nama,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Alamat:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              alamat,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
