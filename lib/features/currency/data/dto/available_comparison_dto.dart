import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AvailableComparisonDto {
  final String pairCode;
  final String label;

  AvailableComparisonDto({
    required this.pairCode,
    required this.label,
  });
}