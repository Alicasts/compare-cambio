import 'package:json_annotation/json_annotation.dart';

part 'available_currency_dto.g.dart';

@JsonSerializable()
class AvailableCurrencyDto {
  final String code;
  final String label;

  AvailableCurrencyDto({
    required this.code,
    required this.label,
  });

  factory AvailableCurrencyDto.fromJson(Map<String, dynamic> json) =>
      _$AvailableCurrencyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableCurrencyDtoToJson(this);
}