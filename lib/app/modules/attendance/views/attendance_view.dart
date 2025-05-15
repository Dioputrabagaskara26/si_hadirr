import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F66B4),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Absensi",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Ilustrasi dan judul absensi
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF2F66B4),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/absen_illustration.png', // Ganti sesuai aset Anda
                  height: 180,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const Text(
                    "Arahkan kamera ke QR Code untuk melakukan absensi",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: MobileScanner(
                        controller: MobileScannerController(
                          facing: CameraFacing.back,
                          torchEnabled: false,
                        ),
                        onDetect: (capture) {
                          final List<Barcode> barcodes = capture.barcodes;
                          for (final barcode in barcodes) {
                            final String? code = barcode.rawValue;
                            if (code != null) {
                              // Tampilkan hasil atau navigasi
                              Get.snackbar("Scan berhasil", "Data: $code");
                            }
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
bottomNavigationBar: BottomNavigationBar(
  currentIndex: 2,
  selectedItemColor: Colors.black,
  unselectedItemColor: Colors.grey,
  onTap: (index) {
    switch (index) {
      case 0:
        Get.offAllNamed('/home'); // Home
        break;
      case 1:
        Get.toNamed('/history'); // History
        break;
      case 2:
        // Absensi sekarang
        break;
      case 3:
        Get.toNamed('/rewards');
        break;
      case 4:
        Get.toNamed('/account');
        break;
    }
  },
  type: BottomNavigationBarType.fixed,
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
    BottomNavigationBarItem(
      icon: CircleAvatar(
        backgroundColor: Colors.black,
        child: Icon(Icons.person, color: Colors.white),
      ),
      label: '',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
  ],
),
    );
  }
}
