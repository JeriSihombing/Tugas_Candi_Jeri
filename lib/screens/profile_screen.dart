import 'package:flutter/material.dart';

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
          // Background Header Warna DeepPurple (Tinggi 200)
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.deepPurple,
          ),
          // Konten Utama
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 130),
                // CircleAvatar Foto Profil (Lokal dengan fallback Online)
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 56,
                          // Menggunakan gambar offline terlebih dahulu
                          backgroundImage: const AssetImage('images/profile_avatar.png'),
                          onForegroundImageError: (exception, stackTrace) {},
                          // Fallback Icon jika gambar lokal tidak ditemukan
                          child: const Icon(Icons.person, size: 60, color: Colors.grey),
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
                // Informasi Detail Pengguna
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      // Baris 1: Pengguna
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
                      // Baris 2: Nama
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
                      // Baris 3: Favorit
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
                      // Tombol Sign In / Sign Out
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