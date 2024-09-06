import 'package:freezed_annotation/freezed_annotation.dart';

part 'life_point.freezed.dart';

@freezed
class LifePoint with _$LifePoint {
  const factory LifePoint({
    required int id,
    required String title,
    required String description,
    required int point, // y축
    required int age, // x축
  }) = _LifePoint;

  factory LifePoint.empty() => const LifePoint(
        id: 0,
        title: '',
        description: '',
        point: 0,
        age: 0,
      );
}