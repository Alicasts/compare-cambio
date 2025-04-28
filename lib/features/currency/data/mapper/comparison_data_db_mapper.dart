import '../../domain/model/comparison_data.dart';

extension ComparisonDataDbMapper on ComparisonData {
  Map<String, dynamic> toMap(String pairCode) {
    return {
      'pairCode': pairCode,
      'date': date.millisecondsSinceEpoch,
      'bid': bid,
      'ask': ask,
      'high': high,
      'low': low,
      'pctChange': pctChange,
    };
  }

  static ComparisonData fromMap(Map<String, dynamic> map) {
    return ComparisonData(
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      bid: map['bid'] as double,
      ask: map['ask'] as double,
      high: map['high'] as double,
      low: map['low'] as double,
      pctChange: map['pctChange'] as double,
    );
  }
}