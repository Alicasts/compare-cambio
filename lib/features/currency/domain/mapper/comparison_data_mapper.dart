import '../../data/dto/comparison_data_dto.dart';
import '../model/comparison_data.dart';

extension ComparisonDataMapper on ComparisonDataDto {
  ComparisonData toDomain() {
    return ComparisonData(
      date: DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000),
      bid: bid,
      ask: ask,
      high: high,
      low: low,
      pctChange: pctChange,
    );
  }
}