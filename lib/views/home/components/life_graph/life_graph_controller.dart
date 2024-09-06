import 'package:get/get.dart';
import 'package:life_graph/data/models/graph_point.dart';

// 그래프 컨트롤러
class LifeGraphController extends GetxController {
  final pointList = <GraphPoint>[].obs;

  addPoint(GraphPoint point) {
    pointList.add(point);
    sortList();
  }

  removePoint(int id) {
    pointList.removeWhere((element) => element.id == id);
    sortList();
  }

  updatePoint(GraphPoint point) {
    final index = pointList.indexWhere((element) => element.id == point.id);
    if (index != -1) {
      pointList[index] = point;
    }
    sortList();
  }

  void sortList() {
    pointList.sort((a, b) => a.x.compareTo(b.x));
  }
}
