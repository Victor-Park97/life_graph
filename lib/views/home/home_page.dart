import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_graph/core/routes/get_routes.dart';
import 'package:life_graph/data/models/life_point.dart';
import 'package:life_graph/util/app_color.dart';
import 'package:life_graph/views/home/components/life_graph/life_graph.dart';
import 'package:life_graph/views/home/components/life_point_list/life_point_list.dart';
import 'package:life_graph/views/home/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: AppColor.neutral[200],
      appBar: AppBar(
        backgroundColor: AppColor.neutral[300],
        surfaceTintColor: AppColor.neutral[300],
        elevation: 2,
        title: Text(
          '인생 그래프',
          style: TextStyle(
            fontSize: 25.h,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await Get.toNamed(
                GetRoutes.updateLifePoint,
                arguments: LifePoint.empty(),
              ) as LifePoint?;

              if (result != null) {
                controller.addButtonPressed(
                  point: result,
                );
              }
            },
            icon: Icon(Icons.add, color: AppColor.neutral[900]),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. 행복도는 -10(가장 슬플때)에서 10(가장 행복할때)사이로 설정해주세요\n2. 추가한 정보를 두번 클릭하면 수정할 수 있습니다\n3. 10개 정도 인생 포인트를 추가해주세요',
              style: TextStyle(
                fontSize: 12.h,
                fontWeight: FontWeight.w400,
                color: AppColor.neutral[800],
              ),
            ).paddingOnly(top: 12, left: 12),
            LifeGraph(
              controller: controller.lifeGraphController,
            ).paddingOnly(top: 12),
            LifePointList(
              controller: controller.lifePointListController,
              onEditTap: (point) async {
                final result = await Get.toNamed(
                  GetRoutes.updateLifePoint,
                  arguments: point,
                ) as LifePoint?;

                if (result != null) {
                  controller.updateButtonPressed(point: result);
                }
              },
              onDeleteTap: (point) {
                controller.deleteButtonPressed(point: point);
              },
            ).paddingOnly(top: 4, left: 8),
          ],
        ).paddingSymmetric(horizontal: 10),
      ),
    );
  }
}
