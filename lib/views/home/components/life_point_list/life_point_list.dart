import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_graph/data/models/life_point.dart';
import 'package:life_graph/util/app_color.dart';
import 'package:life_graph/views/home/components/life_point_list/life_point_controller.dart';

class LifePointList extends StatelessWidget {
  const LifePointList(
      {super.key, required this.controller, required this.onEditTap, required this.onDeleteTap});

  final LifePointListController controller;
  final Function(LifePoint) onEditTap;
  final Function(LifePoint) onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return GetX<LifePointListController>(
      init: controller,
      builder: (controller) {
        return Column(
          children: controller.listPointList
              .map((point) => _LifePointListTile(
                    point: point,
                    onEditTap: onEditTap,
                    onDeleteTap: onDeleteTap,
                  ))
              .toList(),
        );
      },
    );
  }
}

class _LifePointListTile extends StatelessWidget {
  const _LifePointListTile(
      {required this.point, required this.onEditTap, required this.onDeleteTap});

  final LifePoint point;
  final Function(LifePoint) onEditTap;
  final Function(LifePoint) onDeleteTap;

  @override
  Widget build(BuildContext context) {
    final regularTextStyle = TextStyle(
      fontSize: 12.h,
      fontWeight: FontWeight.w400,
      color: AppColor.neutral[500],
    );

    final boldTextStyle = TextStyle(
      fontSize: 15.h,
      fontWeight: FontWeight.w600,
      color: AppColor.neutral[900],
    );

    return Container(
      constraints: BoxConstraints(minHeight: 36.h),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onDoubleTap: () => onEditTap(point),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${point.title} ',
                            style: boldTextStyle,
                          ),
                          TextSpan(
                            text: '${point.point}점 / ${point.age}살',
                            style: regularTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      point.description,
                      style: regularTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () => onDeleteTap(point),
              icon: Icon(
                Icons.delete,
                color: AppColor.neutral[500],
                size: 20.h,
              ),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    ).paddingOnly(bottom: 10, left: 10, right: 10);
  }
}
