import 'package:flutter/material.dart';

class TambahTokoScreen extends StatelessWidget {
  const TambahTokoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FFF1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 395,
              height: 864,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFF2FFF1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  // Status Bar (Time)
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 393,
                      height: 52,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      child: Stack(
                        children: [
                          const Text(
                            '9:30',
                            style: TextStyle(
                              color: Color(0xFF1D1B20),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                              letterSpacing: 0.14,
                            ),
                          ),
                          Container(width: 17, height: 17),
                          Container(width: 8, height: 15, child: Stack()),
                        ],
                      ),
                    ),
                  ),

                  // Back Button and Title
                  Positioned(
                    left: 25,
                    top: 90,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 27,
                        height: 28,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF2FFF1),
                        ),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 57,
                    top: 90,
                    child: const Text(
                      'Toko Makanan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  // Image Upload Section
                  Positioned(
                    left: 52,
                    top: 137,
                    child: Container(
                      width: 296,
                      height: 172,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.cloud_upload, size: 35),
                          const SizedBox(height: 10),
                          const Text(
                            'Unggah Gambar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Nama Tempat Makan Field
                  Positioned(
                    left: 52,
                    top: 329,
                    child: Container(
                      width: 296,
                      height: 23,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nama Tempat Makan',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Alamat Tempat Makan Field
                  Positioned(
                    left: 54,
                    top: 360,
                    child: Container(
                      width: 294,
                      height: 57,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          maxLines: 2,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Alamat Tempat Makan',
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Simpan Button
                  Positioned(
                    left: 272,
                    top: 442,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4C6F49),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: const Size(76.23, 32),
                      ),
                      onPressed: () {
                        // Add save functionality here
                      },
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
