class AvailableComparison {
  final String pairCode;
  final String label;

  AvailableComparison({
    required this.pairCode,
    required this.label,
  });

  String get baseCode => pairCode.split('-').first;
  String get targetCode => pairCode.split('-').last;
}