import 'package:injectable/injectable.dart';

import '../../domain/model/comparison_data.dart';
import '../dto/comparison_data_dto.dart';

@injectable
class ComparisonDataMapper {
  ComparisonData fromDto(ComparisonDataDto dto) {
    return ComparisonData(
      date: DateTime.fromMillisecondsSinceEpoch(int.parse(dto.timestamp)),
      bid: dto.bid,
      ask: dto.ask,
      high: dto.high,
      low: dto.low,
      pctChange: dto.pctChange,
    );
  }
}