import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class EditTokoScreen extends StatefulWidget {
  final int index;

  const EditTokoScreen({super.key, required this.index});

  @override
  State<EditTokoScreen> createState() => _EditTokoScreenState();
}

class _EditTokoScreenState extends State<EditTokoScreen> {
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    final box = Hive.box('tokoMakananBox');
    final data = box.getAt(widget.index);
    namaController.text = data['nama'] ?? '';
    alamatController.text = data['alamat'] ?? '';
    if (data['gambar'] != null && data['gambar'].toString().isNotEmpty) {
      _image = File(data['gambar']);
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    alamatController.dispose();
    super.dispose();
  }

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
                  // Status Bar
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 393,
                      height: 52,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      child: const Text(
                        '9:30',
                        style: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  // Back Button and Title
                  Positioned(
                    left: 25,
                    top: 90,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const Positioned(
                    left: 57,
                    top: 90,
                    child: Text(
                      'Edit Toko Makanan',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  // Gambar dan upload baru
                  Positioned(
                    left: 52,
                    top: 137,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 296,
                        height: 172,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9D9D9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: _image == null
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.cloud_upload, size: 35),
                                  SizedBox(height: 10),
                                  Text(
                                    'Unggah Gambar',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  _image!,
                                  width: 296,
                                  height: 172,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                  ),

                  // Nama Toko
                  Positioned(
                    left: 52,
                    top: 329,
                    child: Container(
                      width: 296,
                      height: 23,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: namaController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nama Tempat Makan',
                        ),
                      ),
                    ),
                  ),

                  // Alamat Toko
                  Positioned(
                    left: 54,
                    top: 360,
                    child: Container(
                      width: 294,
                      height: 57,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        controller: alamatController,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Alamat Tempat Makan',
                        ),
                      ),
                    ),
                  ),

                  // Tombol Simpan
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
                        final box = Hive.box('tokoMakananBox');
                        box.putAt(widget.index, {
                          'nama': namaController.text.trim(),
                          'alamat': alamatController.text.trim(),
                          'gambar': _image?.path ?? '',
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Data berhasil diperbarui')),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
