import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            DetailHeader(),
            DetailInfo(),
            DetailGallery(),
          ],
        ),
      ),
    );
  }
}

// Sub-Widget 1: Header (Gambar Utama Candi)
class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Gambar Utama (Asset Offline + Network Fallback Online)
        Image.asset(
          'images/candi_singosari_main.jpg',
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(
              'https://images.unsplash.com/photo-1609946850974-958a74e53e41?q=80&w=800',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          },
        ),
      ],
    );
  }
}

// Sub-Widget 2: Informasi Detail Candi
class DetailInfo extends StatelessWidget {
  const DetailInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Candi Singosari',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.favorite, color: Colors.red),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Icon(Icons.location_on, color: Colors.red, size: 18),
              SizedBox(width: 8),
              Text('Lokasi : Malang, Jawa Timur'),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.calendar_month, color: Colors.blue, size: 18),
              SizedBox(width: 8),
              Text('Dibangun : Abad ke-13'),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              Icon(Icons.account_balance, color: Colors.green, size: 18),
              SizedBox(width: 8),
              Text('Tipe : Candi Hindu-Buddha'),
            ],
          ),
          const Divider(height: 24),
          const Text(
            'Deskripsi',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Candi Singasari adalah situs Hindu-Buddha bersejarah dari Kerajaan Singasari, '
            'terletak di Singosari, Malang, Jawa Timur, Indonesia, sekitar 10 km dari Kota Malang. '
            'Candi ini merupakan tempat pemujaan Raja Kertanegara, raja terakhir Singasari.',
            textAlign: TextAlign.justify,
          ),
          const Divider(height: 24),
        ],
      ),
    );
  }
}

// Sub-Widget 3: Galeri Gambar Horizontal
class DetailGallery extends StatelessWidget {
  const DetailGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> offlineImages = [
      'images/galeri1.jpg',
      'images/galeri2.jpg',
      'images/galeri3.jpg',
    ];

    final List<String> onlineImages = [
      'https://picsum.photos/id/1015/200/200',
      'https://picsum.photos/id/1043/200/200',
      'https://picsum.photos/id/1047/200/200',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Galeri',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offlineImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      offlineImages[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          onlineImages[index],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}