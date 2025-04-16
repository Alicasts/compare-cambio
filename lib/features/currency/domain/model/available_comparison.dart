import 'package:hive/hive.dart';

part 'available_comparison.g.dart';

@HiveType(typeId: 1)
class AvailableComparison {

  @HiveField(0)
  final String pairCode;

  @HiveField(1)
  final String label;


  AvailableComparison({
    required this.pairCode,
    required this.label,
  });

  String get baseCode => pairCode.split('-').first;
  String get targetCode => pairCode.split('-').last;
}