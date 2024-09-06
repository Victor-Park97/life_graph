import 'package:get/get.dart';
import 'package:life_graph/views/home/home_view_model.dart';

class ViewModelBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}