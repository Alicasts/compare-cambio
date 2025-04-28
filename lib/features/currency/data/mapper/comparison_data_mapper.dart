import 'package:injectable/injectable.dart';

import '../../domain/model/comparison_data.dart';
import '../dto/comparison_data_dto.dart';

@injectable
class ComparisonDataMapper {
  ComparisonData fromDto(ComparisonDataDto dto) {
    return ComparisonData(
      date: DateTime.fromMillisecondsSinceEpoch(int.parse(dto.timestamp) * 1000).toLocal(),
      bid: dto.bid,
      ask: dto.ask,
      high: dto.high,
      low: dto.low,
      pctChange: _parsePctChange(dto.pctChange),
    );
  }

  double _parsePctChange(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) {
      return double.tryParse(value.replaceAll(',', '.').replaceAll('%', '')) ?? 0.0;
    }
    return 0.0;
  }
}