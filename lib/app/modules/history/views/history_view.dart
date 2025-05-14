import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  Widget _buildHistoryItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    bool isTransaction = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: const Color(0xFF7B9BCF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 24, color: Colors.black),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                if (isTransaction)
                  Text(
                    "Groceries | Pantry | -\$100,00",
                    style: TextStyle(color: Colors.blue[200], fontSize: 14),
                  ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Text(
              time,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFFDCEBFF),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        ...items,
        const SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Riwayat",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection("Today", [
              _buildHistoryItem(
                icon: Icons.notifications_outlined,
                title: "Reminder!",
                subtitle: "Set up your automatic savings to meet your savings goal...",
                time: "17:00 – April 24",
              ),
              _buildHistoryItem(
                icon: Icons.notifications_outlined,
                title: "New Update",
                subtitle: "Set up your automatic savings to meet your savings goal...",
                time: "17:00 – April 24",
              ),
            ]),
            _buildSection("Yesterday", [
              _buildHistoryItem(
                icon: Icons.notifications_outlined,
                title: "Transactions",
                subtitle: "A new transaction has been registered",
                time: "17:00 – April 24",
                isTransaction: true,
              ),
              _buildHistoryItem(
                icon: Icons.notifications_outlined,
                title: "Reminder!",
                subtitle: "Set up your automatic savings to meet your savings goal...",
                time: "17:00 – April 24",
              ),
            ]),
            _buildSection("This Weekend", [
              _buildHistoryItem(
                icon: Icons.notifications_outlined,
                title: "Expense Record",
                subtitle: "We recommend that you be more attentive to your finances.",
                time: "17:00 – April 24",
              ),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.offAllNamed('/home');
              break;
            case 1:
              // Do nothing, already on history
              break;
            case 2:
              Get.toNamed('/profile');
              break;
            case 3:
              Get.toNamed('/rewards');
              break;
            case 4:
              Get.toNamed('/account');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
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
            icon: Icon(Icons.card_giftcard),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
