import 'package:flutter/material.dart';
import 'package:uts/login.dart';
import 'profil.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // 🔹 Tentukan tinggi gambar banner responsif (tetap besar di PC)
    final double bannerHeight = screenWidth > 800 ? 280 : 180;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,
        title: Column(
          children: const [
            Text(
              "UKM Bulu Tangkis",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Universitas PGRI Semarang",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              "Dashboard Admin",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        toolbarHeight: 90,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      backgroundColor: Colors.blue[50],
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8EC5FC), Color(0xFFE0C3FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // 🔹 Banner di atas avatar
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'images/background.png',
                    height: bannerHeight,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Hai, Erika!",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // 🔹 GRID MENU RESPONSIF
                LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount;
                    if (constraints.maxWidth < 500) {
                      crossAxisCount = 2; // MOBILE
                    } else {
                      crossAxisCount = 4; // PC
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.count(
                        crossAxisCount: crossAxisCount,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 40,
                        crossAxisSpacing: 40,
                        children: [
                          _buildMenuCard(
                            title: "Presensi",
                            subtitle:
                                "Daftar anggota | Tanggal kegiatan | Shuttlecock",
                            onTap: () {},
                          ),
                          _buildMenuCard(
                            title: "Keuangan",
                            subtitle: "Kas | Pengeluaran",
                            onTap: () {},
                          ),
                          _buildMenuCard(
                            title: "Shuttlecock",
                            subtitle: "Status | Jumlah",
                            onTap: () {},
                          ),
                          _buildMenuCard(
                            title: "Laporan",
                            subtitle: "Unduh .pdf",
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),

      // 🔹 FOOTER MENU
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 🔹 Menu Data
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.list_alt, color: Colors.blue, size: 30),
                SizedBox(height: 2),
                Text(
                  "Data",
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
            // 🔹 Menu Profil
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.person, color: Colors.blue, size: 30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilPage(),
                      ),
                    );
                  },
                ),
                const Text(
                  "Profil",
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
            // 🔹 Menu Setting
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.settings, color: Colors.blue, size: 30),
                SizedBox(height: 2),
                Text(
                  "Setting",
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
            // 🔹 Menu Logout
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.logout, color: Colors.blue, size: 30),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
                const Text(
                  "Logout",
                  style: TextStyle(fontSize: 12, color: Colors.black87),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 KOMPONEN KARTU MENU
  Widget _buildMenuCard({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
