import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../shared/utils/input/currency_input_utils.dart';

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

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(CurrencyInputUtils.validDecimalInput),
      ],
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        if (focusNode.hasFocus) {
          final parsed = CurrencyInputUtils.tryParse(value);
          if (parsed != null) onValidValue(parsed);
        }
      },
    );
  }
}