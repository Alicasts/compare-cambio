import '../../data/dto/available_comparison_dto.dart';
import '../model/available_comparison.dart';

extension AvailableComparisonMapper on AvailableComparisonDto {
  AvailableComparison toDomain() {
    return AvailableComparison(
      pairCode: pairCode,
      label: label,
    );
  }
}