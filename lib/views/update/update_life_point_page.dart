import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:life_graph/data/models/life_point.dart';
import 'package:life_graph/views/update/update_life_point_view_model.dart';

class UpdateLifePointPage extends StatefulWidget {
  const UpdateLifePointPage({super.key});

  @override
  State<UpdateLifePointPage> createState() => _UpdateLifePointPageState();
}

class _UpdateLifePointPageState extends State<UpdateLifePointPage> {
  late final UpdateLifePointViewModel controller;

  @override
  void initState() {
    super.initState();
    final lifePoint = Get.arguments as LifePoint?;
    controller = Get.put(UpdateLifePointViewModel(lifePoint));
  }

  @override
  void dispose() {
    Get.delete<UpdateLifePointViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '인생 포인트 ${controller.isEditing ? '수정' : '추가'}하기',
          style: TextStyle(
            fontSize: 25.h,
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: controller.buttonEnabled.value
              ? () {
                  final lifePoint = controller.getLifePoint();
                  Get.back(result: lifePoint);
                }
              : null,
          child: Icon(controller.buttonEnabled.value ? Icons.save : Icons.close),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          children: [
            _UpdateLifePointTextField(
              controller: controller.titleController,
              labelText: '제목을 입력해주세요',
              validCheck: controller.titleValidator,
              errorText: '제목은 필수 입력 항목입니다.',
              title: '제목 ex. 내 인생에서 가장 행복한 순간',
            ).paddingOnly(top: 20.h),
            _UpdateLifePointTextField(
              controller: controller.pointController,
              labelText: '행복도를 입력해주세요 (-10 ~ 10)',
              validCheck: controller.pointValidator,
              errorText: '행복도는 -10에서 10 사이의 숫자만 입력 가능합니다.',
              onlyNumber: true,
              title: '행복도 ex. 10(점)',
            ),
            _UpdateLifePointTextField(
              controller: controller.ageController,
              labelText: '그때 당시의 나이를 입력해주세요',
              validCheck: controller.ageValidator,
              errorText: '나이는 0보다 큰 숫자만 입력 가능합니다.',
              onlyNumber: true,
              title: '나이 ex. 8(살)',
            ),
            _UpdateLifePointTextField(
              controller: controller.descriptionController,
              labelText: '설명을 입력해주세요',
              title: '설명 ex. 그때는 모든게 완벽했어요! 너무 행복했어요!',
            ),
          ],
        ),
      ),
    );
  }
}

class _UpdateLifePointTextField extends StatelessWidget {
  const _UpdateLifePointTextField({
    required this.controller,
    required this.labelText,
    this.validCheck,
    this.errorText,
    this.onlyNumber = false,
    required this.title,
  });

  final TextEditingController controller;
  final String title;
  final String labelText;
  final RxBool? validCheck;
  final String? errorText;
  final bool onlyNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h, top: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15.h,
            ),
          ).paddingOnly(bottom: 8.h),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                fontSize: 15.h,
              ),
              border: const OutlineInputBorder(),
            ),
            keyboardType: onlyNumber ? TextInputType.number : TextInputType.text,
          ),
          if (validCheck != null)
            Obx(() => validCheck!.value
                ? const SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      errorText ?? '',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.h,
                      ),
                    ),
                  )),
        ],
      ),
    );
  }
}
