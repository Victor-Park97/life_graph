import 'package:get/get.dart';
import 'package:life_graph/data/models/graph_point.dart';
import 'package:life_graph/data/models/life_point.dart';
import 'package:life_graph/views/home/components/life_graph/life_graph_controller.dart';
import 'package:life_graph/views/home/components/life_point_list/life_point_controller.dart';

// 홈 화면 컨트롤러
class HomeController extends GetxController {
  late final LifeGraphController lifeGraphController;
  late final LifePointListController lifePointListController;

  @override
  void onInit() {
    super.onInit();
    lifeGraphController = Get.put(LifeGraphController());
    lifePointListController = Get.put(LifePointListController());
  }

  void addButtonPressed({
    required LifePoint point,
  }) {
    int id = lifePointListController.listPointList.length + 1;
    lifePointListController.addPoint(point.copyWith(id: id));
    lifeGraphController.addPoint(GraphPoint(id: id, x: point.age, y: point.point));
  }

  void deleteButtonPressed({
    required LifePoint point,
  }) {
    lifePointListController.deletePoint(point);
    lifeGraphController.removePoint(point.id);
  }

  void updateButtonPressed({
    required LifePoint point,
  }) {
    lifePointListController.updatePoint(point);
    lifeGraphController.updatePoint(GraphPoint(id: point.id, x: point.age, y: point.point));
  }

  @override
  void onClose() {
    super.onClose();
    Get.delete<LifeGraphController>();
    Get.delete<LifePointListController>();
  }
}
