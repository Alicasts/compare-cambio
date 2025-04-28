class ComparisonDataDto {
  final String timestamp;
  final String? code;
  final String? codein;
  final String? name;
  final double bid;
  final double ask;
  final double high;
  final double low;
  final double pctChange;

  ComparisonDataDto({
    required this.timestamp,
    required this.bid,
    required this.ask,
    required this.high,
    required this.low,
    required this.pctChange,
    this.code,
    this.codein,
    this.name,
  });

  factory ComparisonDataDto.fromJson(Map<String, dynamic> json) {
    return ComparisonDataDto(
      timestamp: json['timestamp'],
      code: json['code'],
      codein: json['codein'],
      name: json['name'],
      bid: double.tryParse(json['bid'] ?? '') ?? 0.0,
      ask: double.tryParse(json['ask'] ?? '') ?? 0.0,
      high: double.tryParse(json['high'] ?? '') ?? 0.0,
      low: double.tryParse(json['low'] ?? '') ?? 0.0,
      pctChange: double.tryParse(json['pctChange'] ?? '') ?? 0.0,
    );
  }
}