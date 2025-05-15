import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: controller.navigateTo,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,
                    color: controller.selectedIndex.value == 0 ? Colors.black : Colors.grey),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history,
                    color: controller.selectedIndex.value == 1 ? Colors.black : Colors.grey),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard,
                    color: controller.selectedIndex.value == 3 ? Colors.black : Colors.grey),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline,
                    color: controller.selectedIndex.value == 4 ? Colors.black : Colors.grey),
                label: '',
              ),
            ],
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Home",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildUserBanner(),
              const SizedBox(height: 20),
              _buildMenuRow(),
              const SizedBox(height: 20),
              _buildCalendar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserBanner() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2F5D8A),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF3A6D9D),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage('assets/images/bg_banner.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Twistzz.",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("Siswa", style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.chevron_right, color: Colors.white),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: const [
                Icon(Icons.card_giftcard, color: Colors.white),
                SizedBox(width: 8),
                Text("Poin Anda", style: TextStyle(color: Colors.white, fontSize: 16)),
                Spacer(),
                Text("69.690",
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2F5D8A),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMenuItem(
            Icons.school,
            "Absensi",
            color: Colors.blue,
            onTap: () => Get.toNamed('/attendance'),
          ),
          _buildMenuItem(
            Icons.history,
            "Riwayat",
            color: Colors.blue,
            onTap: () => Get.toNamed('/history'),
          ),
          _buildMenuItem(
            Icons.card_giftcard,
            "Rewards",
            color: Colors.blue,
            onTap: () => Get.toNamed('/rewards'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, {required Color color, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2F5D8A),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("24", style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold)),
                  Text("Rabu", style: TextStyle(fontSize: 16, color: Colors.white)),
                  Text("Jan 2069", style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFC4C9CD),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Today",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDateItem('S', '21'),
              _buildDateItem('M', '22'),
              _buildDateItem('T', '23'),
              _buildDateItem('W', '24', isSelected: true),
              _buildDateItem('T', '25'),
              _buildDateItem('F', '26'),
              _buildDateItem('S', '27'),
            ],
          ),
          const SizedBox(height: 20),
          Container(width: double.infinity, height: 1, color: Colors.white.withOpacity(0.2)),
          const SizedBox(height: 16),
          const Text("• 25 Januari Hari Raya Sigma", style: TextStyle(color: Colors.white, fontSize: 14)),
          const SizedBox(height: 6),
          const Text("• 26 Januari Hari Rusdi Halimawan", style: TextStyle(color: Colors.white, fontSize: 14)),
        ]),
      ),
    );
  }

  Widget _buildDateItem(String day, String date, {bool isSelected = false}) {
    return Column(
      children: [
        Text(day, style: const TextStyle(color: Colors.white, fontSize: 12)),
        const SizedBox(height: 8),
        Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFCDC2A5) : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(date, style: const TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ],
    );
  }
}
