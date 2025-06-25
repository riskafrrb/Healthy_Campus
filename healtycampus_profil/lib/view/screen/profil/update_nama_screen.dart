import 'package:flutter/material.dart';
import 'package:healthy_campus/utill/style.dart';
import 'package:sizer/sizer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:healthy_campus/models/user_model.dart';

class UpdateNamaScreen extends StatefulWidget {
  const UpdateNamaScreen({super.key});

  @override
  State<UpdateNamaScreen> createState() => _UpdateNamaScreenState();
}

class _UpdateNamaScreenState extends State<UpdateNamaScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final sessionBox = Hive.box('sessionBox');
    final username = sessionBox.get('username', defaultValue: '-');
    _nameController.text = username;
  }

  Future<void> _saveName() async {
    final sessionBox = Hive.box('sessionBox');
    final userBox = Hive.box<UserModel>('userBox');

    final newName = _nameController.text.trim();
    final email = sessionBox.get('email'); // identitas unik user

    // Update sessionBox (untuk tampil nama sekarang)
    await sessionBox.put('username', newName);

    // Cari user di userBox berdasarkan email
    final index =
        userBox.values.toList().indexWhere((user) => user.email == email);
    if (index != -1) {
      final oldUser = userBox.getAt(index);
      final updatedUser = UserModel(
        username: newName,
        password: oldUser!.password,
        email: oldUser.email,
        role: oldUser.role,
      );
      await userBox.putAt(index, updatedUser);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'Ubah Nama',
          style: openSansMedium.copyWith(fontSize: 20.sp),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'Nama ini akan tampil di beberapa halaman.',
                textAlign: TextAlign.left,
                style: openSansRegular,
              ),
            ),
            SizedBox(height: 1.5.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
              decoration: BoxDecoration(
                color: const Color(0XFFF2F2F2),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.transparent),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.h),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  labelStyle: openSansRegular.copyWith(fontSize: 15.sp),
                  hintText: 'Nama Anda',
                  fillColor: Colors.transparent,
                  hintStyle: openSansRegular.copyWith(
                    fontSize: 15.sp,
                    color: const Color(0XFFC5C0C0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll<Color>(
                    Theme.of(context).primaryColor),
                foregroundColor:
                    const WidgetStatePropertyAll<Color>(Colors.white),
              ),
              onPressed: _saveName,
              child: Text(
                'Simpan',
                style: openSansMedium.copyWith(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
