import 'package:get/instance_manager.dart';
import 'package:quitanda/src/pages/home/controller/home_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
