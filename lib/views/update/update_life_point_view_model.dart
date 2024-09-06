import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:life_graph/data/models/life_point.dart';

class UpdateLifePointViewModel extends GetxController {
  final LifePoint lifePoint;

  UpdateLifePointViewModel(LifePoint? lifePoint) : lifePoint = lifePoint ?? LifePoint.empty();

  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController pointController;
  late final TextEditingController ageController;

  final pointValidator = false.obs;
  final ageValidator = false.obs;
  final titleValidator = false.obs;

  final buttonEnabled = false.obs;

  bool get isEditing => lifePoint.id != 0;

  LifePoint getLifePoint() {
    return LifePoint(
      id: lifePoint.id,
      title: titleController.text,
      description: descriptionController.text,
      point: int.parse(pointController.text),
      age: int.parse(ageController.text),
    );
  }

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController(text: lifePoint.title);
    descriptionController = TextEditingController(text: lifePoint.description);
    pointController = TextEditingController(text: lifePoint.point.toString());
    ageController = TextEditingController(text: lifePoint.age.toString());

    titleController.addListener(_validateInputs);
    pointController.addListener(_validateInputs);
    ageController.addListener(_validateInputs);

    _validateInputs();
  }

  void _validateInputs() {
    titleValidator.value = titleController.text.isNotEmpty;
    pointValidator.value = pointController.text.isNotEmpty && 
                           int.tryParse(pointController.text) != null &&
                           int.parse(pointController.text) >= -10 &&
                           int.parse(pointController.text) <= 10;
    ageValidator.value = ageController.text.isNotEmpty && 
                         int.tryParse(ageController.text) != null &&
                         int.parse(ageController.text) > 0;
    
    buttonEnabled.value = titleValidator.value && pointValidator.value && ageValidator.value;
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    pointController.dispose();
    ageController.dispose();
    super.onClose();
  }
}
