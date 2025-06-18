import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarChallenge extends StatefulWidget {
  const CalendarChallenge({super.key});

  @override
  State<CalendarChallenge> createState() => _CalendarChallengeState();
}

class _CalendarChallengeState extends State<CalendarChallenge>
    with SingleTickerProviderStateMixin {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, int> _waterIntake = {};
  final Set<DateTime> _savedDays = {};
  final int _dailyTarget = 2000;
  int _todayIntake = 0;

  late AnimationController _animationController;
  late Animation<double> _waterLevelAnimation;

  DateTime get _today =>
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _waterLevelAnimation = Tween<double>(begin: 0, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _updateWaterLevel(int newIntake) {
    final newRatio = ((newIntake / _dailyTarget).clamp(0, 1)).toDouble();

    _waterLevelAnimation = Tween<double>(
      begin: _waterLevelAnimation.value,
      end: newRatio,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward(from: 0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image full layar
          Image.asset(
            'assets/image/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(
                            'assets/image/back.png',
                            width: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Minum Air',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Tantangan Hidup Sehat',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Tantangan container
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/image/tantangan_bg.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          '30 hari penuhi kebutuhan air-mu!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Botol minum dengan outline dan animasi air
                        SizedBox(
                          width: 100,
                          height: 250,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              // Outline botol digambar dengan CustomPaint
                              CustomPaint(
                                size: const Size(100, 250),
                                painter: BottleOutlinePainter(),
                              ),

                              // Animated air naik dengan ClipPath botol
                              AnimatedBuilder(
                                animation: _waterLevelAnimation,
                                builder: (context, child) {
                                  final waterHeight =
                                      250 * _waterLevelAnimation.value;

                                  return ClipPath(
                                    clipper: BottleClipper(),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: 80,
                                        height: waterHeight,
                                        decoration: BoxDecoration(
                                          // ignore: deprecated_member_use
                                          color: Colors.green.withOpacity(0.7),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'Hari ini: $_todayIntake ml / $_dailyTarget ml',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Stack(
                          children: [
                            Container(
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Container(
                                  width: constraints.maxWidth *
                                      (_todayIntake / _dailyTarget).clamp(0, 1),
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Wrap(
                          spacing: 8,
                          children: [150, 200, 500].map((amount) {
                            return ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _todayIntake += amount;
                                  _waterIntake[_today] = _todayIntake;
                                  _updateWaterLevel(_todayIntake);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              child: Text('+$amount ml'),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Header bulan + tahun
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // ignore: unnecessary_string_interpolations
                          '${DateFormat('MMMM yyyy', 'id_ID').format(_focusedDay)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            setState(() {
                              _focusedDay = DateTime(
                                _focusedDay.year,
                                _focusedDay.month + 1,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  // Kalender
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2020),
                      lastDay: DateTime.utc(2100),
                      focusedDay: _focusedDay,
                      headerVisible: false,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          _todayIntake = _waterIntake[selectedDay] ?? 0;
                          _updateWaterLevel(_todayIntake);
                        });
                      },
                      onPageChanged: (focusedDay) {
                        setState(() {
                          _focusedDay = focusedDay;
                        });
                      },
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, _) {
                          final dateKey = DateTime(
                            day.year,
                            day.month,
                            day.day,
                          );
                          final isSaved = _savedDays.contains(dateKey);
                          return Container(
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSaved
                                  ? Colors.green[300]
                                  : Colors.transparent,
                            ),
                            child: Center(
                              child: isSaved
                                  ? const Icon(Icons.check, size: 16)
                                  : Text(
                                      '${day.day}',
                                      style: TextStyle(
                                        color: isSameDay(day, _today)
                                            ? Colors.blue
                                            : Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                      calendarStyle: const CalendarStyle(
                        todayDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.lightBlue,
                        ),
                        selectedDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Tombol simpan kecil di bawah kalender
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_selectedDay != null) {
                            final key = DateTime(
                              _selectedDay!.year,
                              _selectedDay!.month,
                              _selectedDay!.day,
                            );
                            setState(() {
                              _savedDays.add(key);
                              _waterIntake[key] = _todayIntake;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Progress berhasil disimpan!'),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Painter buat outline botol minum 2000ml
class BottleOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green.shade700
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path();

    // Bentuk botol tinggi ramping dengan mulut dan pangkal bulat

    // Mulai bawah kiri botol
    path.moveTo(size.width * 0.3, size.height);

    // Ke bawah kanan
    path.lineTo(size.width * 0.7, size.height);

    // Lengkung kanan botol naik ke mulut botol
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.6,
      size.width * 0.7,
      size.height * 0.1,
    );

    // Mulut botol atas - garis lurus
    path.lineTo(size.width * 0.3, size.height * 0.1);

    // Lengkung kiri botol turun ke pangkal
    path.quadraticBezierTo(
      size.width * 0.15,
      size.height * 0.6,
      size.width * 0.3,
      size.height,
    );

    canvas.drawPath(path, paint);

    // Tambahkan garis mulut botol atas sebagai oval kecil
    final mouthRect = Rect.fromCenter(
      center: Offset(size.width * 0.5, size.height * 0.1),
      width: size.width * 0.4,
      height: size.height * 0.05,
    );
    canvas.drawOval(mouthRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Clipper untuk bentuk botol (sama dengan path di painter)
class BottleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width * 0.3, size.height);
    path.lineTo(size.width * 0.7, size.height);
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.6,
      size.width * 0.7,
      size.height * 0.1,
    );
    path.lineTo(size.width * 0.3, size.height * 0.1);
    path.quadraticBezierTo(
      size.width * 0.15,
      size.height * 0.6,
      size.width * 0.3,
      size.height,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
