import 'package:get/get.dart';
import 'package:life_graph/data/models/life_point.dart';

// 
class LifePointListController extends GetxController {
  final listPointList = <LifePoint>[
    // LifePoint(
    //   id: 1,
    //   title: '제목',
    //   description: '설명설명설명설명설명설명설명설명설명설명설명설명설명설명',
    //   point: 10,
    //   age: 20,
    // ),
  ].obs;

  void addPoint(LifePoint point) {
    listPointList.add(point);
    sortList();
  }

  void deletePoint(LifePoint point) {
    listPointList.remove(point);
    sortList();
  }

  void updatePoint(LifePoint point) {
    final index = listPointList.indexWhere((element) => element.id == point.id);
    if (index != -1) {
      listPointList[index] = point;
    }
    sortList();
  }

  void sortList() {
    listPointList.sort((a, b) => a.age.compareTo(b.age));
  }
}
