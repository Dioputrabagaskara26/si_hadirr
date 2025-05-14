import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;

  void navigateTo(int index) {
    selectedIndex.value = index;

    switch (index) {
      case 0:
        // Tetap di halaman Home
        break;
      case 1:
        Get.toNamed('/history');
        break;
      case 2:
        // Bisa diarahkan ke halaman profile utama jika ingin
        break;
      case 3:
        Get.toNamed('/rewards');
        break;
      case 4:
        Get.toNamed('/profile');
        break;
    }
  }
}
