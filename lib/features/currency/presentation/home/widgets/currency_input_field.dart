import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final void Function(double value) onValidValue;

  const CurrencyInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.label,
    required this.onValidValue,
  });

  String _formatValue(double value) {
    return value % 1 == 0 ? value.toStringAsFixed(0) : value.toString();
  }

  double? _parseInput(String input) {
    final cleaned = input.replaceAll(',', '.');

    if (RegExp(r'^\d+([.]\d+)?$').hasMatch(cleaned)) {
      return double.tryParse(cleaned);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[\d.,]*')),
      ],
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        if (focusNode.hasFocus) {
          final parsed = _parseInput(value);
          if (parsed != null) onValidValue(parsed);
        }
      },
      onEditingComplete: () {
        final parsed = _parseInput(controller.text.replaceAll(',', '.'));
        if (parsed != null) {
          controller.text = _formatValue(parsed);
        }
      },
    );
  }
}