import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:healthy_campus/view/screen/tantangan/calendar_challenge.dart';
import 'package:healthy_campus/view/screen/homepage/lacak_aktivitas.dart';

class Tantangan extends StatelessWidget {
  const Tantangan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/image/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  const SizedBox(height: 20),
                  const Text(
                    'Tantangan Hidup Sehat',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Yuk coba ikut tantangan Healthy Campus',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 32),

                  // Water Challenge Card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/image/tantangan_bg.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '30 hari penuhi kebutuhan air-mu!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Image.asset(
                            'assets/image/air.png',
                            width: 320,
                            height: 148.06,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Maret',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TableCalendar(
                          firstDay: DateTime.utc(2023, 3, 1),
                          lastDay: DateTime.utc(2023, 3, 31),
                          focusedDay: DateTime.utc(2023, 3, 7),
                          headerVisible: false,
                          daysOfWeekVisible: true,
                          calendarFormat: CalendarFormat.week,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          calendarStyle: const CalendarStyle(
                            todayDecoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: Colors.lightGreen,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CalendarChallenge(),
                              ),
                            );
                          },
                          child: Center(
                            child: Image.asset(
                              'assets/image/lihat_detail.png',
                              width: 320,
                              height: 22.63,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Steps Challenge Card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/image/tantangan_bg.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '1 hari 1000 langkah selama 7 hari!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Image.asset(
                            'assets/image/langkah.png',
                            width: 320,
                            height: 148.06,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Center(
                          child: Text(
                            'Hari ini : 500 / 1000 langkah',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Progress bar with star on the right
                        SizedBox(
                          height: 30,
                          child: Stack(
                            children: [
                              // Progress bar background
                              Container(
                                height: 16,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              // Progress bar fill
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              // Star positioned outside the bar on the right
                              Positioned(
                                left: MediaQuery.of(context).size.width * 0.5 +
                                    12,
                                child: Image.asset(
                                  'assets/image/bintang.png',
                                  width: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Center(
                          child: Text(
                            'Setengah jalan sudah tercapai, tinggal sedikit lagi!\n'
                            'Ayo selesaikan 1000 langkahmu hari ini 💪🔥',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LacakAktivitas(),
                              ),
                            );
                          },
                          child: Center(
                            child: Image.asset(
                              'assets/image/lihat_detail.png',
                              width: 320,
                              height: 22.63,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
