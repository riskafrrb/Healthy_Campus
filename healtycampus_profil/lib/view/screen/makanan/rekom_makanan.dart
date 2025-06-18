import 'package:flutter/material.dart';

class RekomMakanan extends StatelessWidget {
  const RekomMakanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F4E8),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      "Rekomendasi Makanan",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Makanan sehat di sekitar kampus",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    _buildRestaurantCard(
                      imagePath: "assets/image/alfanature.png",
                      name: "Alfanature COLDPRESSED JUICE n SMOOTHIES",
                      rating: 5.0,
                      address:
                          "Perumahan Ikip B 69, Gn. Anyar, Kec. Gn. Anyar, Surabaya, Jawa Timur 60294",
                    ),
                    const SizedBox(height: 16),
                    _buildRestaurantCard(
                      imagePath: "assets/image/dharma.png",
                      name: "Dharma Yogi Detox Centre",
                      rating: 5.0,
                      address:
                          "Grand Alana Regensi, Grand Alana, Jl. Gununganyar Tambak No.B2-02, Gn. Anyar Tambak, Kec. Gn. Anyar, Surabaya, Jawa Timur 60294",
                    ),
                    const SizedBox(height: 16),
                    _buildRestaurantCard(
                      imagePath: "assets/image/dapur.png",
                      name: "Dapur Camilan Sehat",
                      rating: 4.7,
                      address:
                          "Puri Gunung Anyar Regency Jl.Graha Gn.Anyar Tambak, Blok XI D-1, Gn. Anyar Tambak, Kec. Gn. Anyar, Surabaya, Jawa Timur 60294",
                    ),
                    const SizedBox(height: 16),
                    _buildRestaurantCard(
                      imagePath: "assets/image/olara.png",
                      name: "OLARASALAD",
                      rating: 4.7,
                      address:
                          "Jl. Sentra Point blok AD10, Gn. Anyar, Kec. Gn. Anyar, Surabaya, Jawa Timur 60294",
                    ),
                    const SizedBox(height: 16),
                    _buildRestaurantCard(
                      imagePath: "assets/image/greenly.png",
                      name: "Greenly Merr",
                      rating: 4.7,
                      address:
                          "Jl. Raya Semampir No.49E, Medokan Semampir, Kec. Sukolilo, Surabaya, Jawa Timur 60119",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantCard({
    required String imagePath,
    required String name,
    required double rating,
    required String address,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        "$rating",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      _buildStarRating(rating),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/image/maps.png',
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          address,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < fullStars; i++)
          const Icon(Icons.star, color: Colors.amber, size: 16),
        if (hasHalfStar)
          const Icon(Icons.star_half, color: Colors.amber, size: 16),
        for (int i = 0; i < 5 - fullStars - (hasHalfStar ? 1 : 0); i++)
          const Icon(Icons.star_border, color: Colors.amber, size: 16),
      ],
    );
  }
}
