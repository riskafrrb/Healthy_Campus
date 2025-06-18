import 'package:flutter/material.dart';

class DataMakananScreen extends StatelessWidget {
  const DataMakananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FFF1),
      body: SafeArea(
        child: Column(
          children: [
            // Status Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: const Row(
                children: [
                  Text(
                    '9:30',
                    style: TextStyle(
                      color: Color(0xFF1D1B20),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Title
            const Padding(
              padding: EdgeInsets.only(left: 23, top: 20, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Data Toko Makanan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            // Add Store Button (Enhanced to match Artikel screen)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: InkWell(
                onTap: () {
                  // Action when button is tapped
                },
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF5C8858),
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'Tambah Toko Baru',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Table Header
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 23, right: 23),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF5C8858),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(6),
                  ),
                  border: Border.all(color: Colors.white),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Nama Toko',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          'Aksi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Table Content
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final storeNames = [
                    'Alfanature COLDPRESSED JUICE n SMOOTHIES',
                    'Dharma Yogi Detox Centre',
                    'Dapur Camilan Sehat',
                    'OLARASALAD',
                    'Greenly Merr',
                  ];

                  return Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color:
                          index.isOdd ? Colors.white : const Color(0xFFF8FFF8),
                      border: Border.all(color: const Color(0xFF79A375)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              storeNames[index],
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildActionButton(
                                Icons.visibility,
                                'Lihat',
                                const Color(0xFF4C6F49),
                              ),
                              const SizedBox(width: 8),
                              _buildActionButton(
                                Icons.edit,
                                'Edit',
                                const Color(0xFFE9B61F),
                              ),
                              const SizedBox(width: 8),
                              _buildActionButton(
                                Icons.delete,
                                'Hapus',
                                const Color(0xFFEA4335),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Consistent action button style with Artikel screen
  Widget _buildActionButton(IconData icon, String text, Color color) {
    return Tooltip(
      message: text,
      child: Material(
        borderRadius: BorderRadius.circular(4),
        color: color,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            // Action when button is tapped
          },
          child: Container(
            width: 36,
            height: 36,
            padding: const EdgeInsets.all(6),
            child: Icon(icon, color: Colors.white, size: 18),
          ),
        ),
      ),
    );
  }

  // Consistent nav item style with Artikel screen
  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isActive
            ? Container(
                width: 50,
                height: 50,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(icon, color: const Color(0xFF5C8858)),
              )
            : Icon(icon, color: Colors.white),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
