
class CurrencyInputUtils {
  static final RegExp validDecimalInput = RegExp(r'^\d+([.,]?\d{0,4})?$');
  static final RegExp parseableDecimal = RegExp(r'^\d+([.]\d+)?$');

  static double? tryParse(String input) {
    final cleaned = input.replaceAll(',', '.');
    if (parseableDecimal.hasMatch(cleaned)) {
      return double.tryParse(cleaned);
    }
    return null;
  }

  static String format(double value) {
    return value % 1 == 0 ? value.toStringAsFixed(0) : value.toString();
  }
}