import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Candi & Profil',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0; // Default menampilkan Detail Candi Singosari

  final List<Widget> _screens = [
    const DetailScreen(),
    const Center(child: Text('Halaman Pencarian')),
    const Center(child: Text('Halaman Favorit')),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// ==========================================
// WIDGET DETAIL SCREEN (CANDI SINGOSARI)
// ==========================================
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

// --- Detail Header (Gambar Utama Online) ---
class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Candi_Singosari_2017.jpg/800px-Candi_Singosari_2017.jpg',
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator()),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 300,
              color: Colors.grey[300],
              child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
            );
          },
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// --- Detail Info ---
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

// --- Detail Gallery (Gambar Online) ---
class DetailGallery extends StatelessWidget {
  const DetailGallery({super.key});

  @override
  Widget build(BuildContext context) {
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
              itemCount: onlineImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      onlineImages[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
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

// ==========================================
// WIDGET PROFILE SCREEN
// ==========================================
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String pengguna = 'rachmadi';
  String nama = 'Muhammad Rachmadi';
  int favoritCount = 0;
  bool isSignedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 130),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 56,
                          backgroundImage: const NetworkImage(
                            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=200',
                          ),
                          child: Container(),
                        ),
                      ),
                      if (isSignedIn)
                        const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.edit, size: 16, color: Colors.white),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.lock, color: Colors.amber),
                          const SizedBox(width: 8),
                          const SizedBox(width: 80, child: Text('Pengguna')),
                          const Text(' : '),
                          Expanded(
                            child: Text(
                              pengguna,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Icon(Icons.person, color: Colors.blue),
                          const SizedBox(width: 8),
                          const SizedBox(width: 80, child: Text('Nama')),
                          const Text(' : '),
                          Expanded(
                            child: Text(
                              nama,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          if (isSignedIn)
                            IconButton(
                              icon: const Icon(Icons.edit, size: 18),
                              onPressed: () {},
                            ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Icon(Icons.favorite, color: Colors.red),
                          const SizedBox(width: 8),
                          const SizedBox(width: 80, child: Text('Favorit')),
                          const Text(' : '),
                          Expanded(
                            child: Text(
                              '$favoritCount',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(height: 30),
                      TextButton(
                        style: TextButton.styleFrom(
                          side: BorderSide(color: isSignedIn ? Colors.red : Colors.blue),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        onPressed: () {
                          setState(() {
                            isSignedIn = !isSignedIn;
                          });
                        },
                        child: Text(
                          isSignedIn ? 'Sign Out' : 'Sign In',
                          style: TextStyle(color: isSignedIn ? Colors.red : Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}