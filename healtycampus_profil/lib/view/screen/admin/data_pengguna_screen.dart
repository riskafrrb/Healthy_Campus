import 'package:flutter/material.dart';

class DataPenggunaScreen extends StatelessWidget {
  const DataPenggunaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FFF1),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Data Pengguna',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // Table
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Table(
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: const Color(0xFF79A375),
                        width: 1.0,
                      ),
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(1),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(2),
                    },
                    children: [
                      // Table Header
                      TableRow(
                        decoration: BoxDecoration(
                          color: const Color(0xFF5C8858),
                        ),
                        children: [
                          _buildHeaderCell('ID'),
                          _buildHeaderCell('Nama Lengkap'),
                          _buildHeaderCell('Aksi'),
                        ],
                      ),

                      // Table Rows
                      for (int i = 1; i <= 5; i++)
                        TableRow(
                          decoration: BoxDecoration(
                            color: i.isOdd
                                ? const Color(0xFFF2FFF1)
                                : Colors.white,
                          ),
                          children: [
                            _buildDataCell('$i'),
                            _buildDataCell('Nama Pengguna $i'),
                            _buildActionCell(),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(child: Text(text)),
    );
  }

  Widget _buildActionCell() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tombol Lihat
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF4C6F49),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Lihat',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),

            const SizedBox(width: 8),

            // Tombol Hapus
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEA4335), // Warna merah
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Hapus',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
