part of 'points_cubit.dart';

@freezed
class PointsState with _$PointsState {
  const factory PointsState({
    @Default(0) int currentPoints,
    @Default([]) List<Map<String, String>> updates,
  }) = _PointsState;
}