import 'package:get/get.dart';
import '../../routes/Routes.dart';

class PageMessage {
  static GoPageMessage() async {
    Get.toNamed("/message");
  }

  static BackPage() async {
    Get.back();
  }
}
