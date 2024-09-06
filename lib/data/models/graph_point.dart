import 'package:freezed_annotation/freezed_annotation.dart';

part 'graph_point.freezed.dart';

@freezed
class GraphPoint with _$GraphPoint {
  const factory GraphPoint({
    required int id,
    required int x,
    required int y,
  }) = _GraphPoint;
}