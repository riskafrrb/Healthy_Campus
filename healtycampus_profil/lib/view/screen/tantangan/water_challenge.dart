import 'package:flutter/material.dart';

class WaterChallenge extends StatelessWidget {
  const WaterChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F4E8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: const Text("Minum Air", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Tantangan Hidup Sehat", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Image.asset('assets/images/minum.png', height: 120),
            const SizedBox(height: 8),
            const Text("30 hari penuhi kebutuhan air-mu!"),
            const SizedBox(height: 16),
            const Text("Hari ini : 1200 ml / 2000 ml"),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 1200 / 2000,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            const SizedBox(height: 16),

            // Tombol volume air
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                AddWaterButton(amount: 150),
                AddWaterButton(amount: 200),
                AddWaterButton(amount: 500),
              ],
            ),

            const SizedBox(height: 24),

            // Kalender mini
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Maret >",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Table(
              border: TableBorder.all(color: Colors.transparent),
              children: [
                _buildWeekRow(["S", "S", "R", "K", "J", "S", "M"], bold: true),
                _buildWeekRow(
                  ["1", "2", "3", "4", "5", "6", "7"],
                  highlight: [2, 3, 4, 5],
                ),
                _buildWeekRow(
                  ["8", "9", "10", "11", "12", "13", "14"],
                  highlight: [8],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildWeekRow(
    List<String> days, {
    List<int> highlight = const [],
    bool bold = false,
  }) {
    return TableRow(
      children: days.map((day) {
        final isHighlighted =
            int.tryParse(day) != null && highlight.contains(int.parse(day));
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: isHighlighted ? Colors.red[200] : Colors.transparent,
          child: Center(
            child: Text(
              day,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class AddWaterButton extends StatelessWidget {
  final int amount;

  const AddWaterButton({required this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[400],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        // Tambahkan logika update jumlah air
      },
      child: Text("+$amount ml"),
    );
  }
}
