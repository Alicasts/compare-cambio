import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/currency_conversion_view_model.dart';
import 'currency_input_field.dart';

class CurrencyConversionWidget extends StatefulWidget {
  const CurrencyConversionWidget({super.key});

  @override
  State<CurrencyConversionWidget> createState() => _CurrencyConversionWidgetState();
}

class _CurrencyConversionWidgetState extends State<CurrencyConversionWidget> {
  final _baseController = TextEditingController();
  final _convertedController = TextEditingController();
  final _baseFocus = FocusNode();
  final _convertedFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    final vm = context.read<CurrencyConversionViewModel>();
    _syncControllers(vm);
    vm.addListener(() => _syncControllers(vm));
  }

  void _syncControllers(CurrencyConversionViewModel vm) {
    _baseController.text = _formatValue(vm.baseAmount);
    _convertedController.text = _formatValue(vm.convertedAmount);
  }

  String _formatValue(double value) {
    return value % 1 == 0 ? value.toStringAsFixed(0) : value.toString();
  }

  @override
  void dispose() {
    context.read<CurrencyConversionViewModel>().removeListener(() => _syncControllers(context.read()));
    _baseController.dispose();
    _convertedController.dispose();
    _baseFocus.dispose();
    _convertedFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CurrencyConversionViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Conversão de ${vm.baseCurrency} para ${vm.targetCurrency}'),
        const SizedBox(height: 12),
        CurrencyInputField(
          controller: _baseController,
          focusNode: _baseFocus,
          label: 'Valor em ${vm.baseCurrency}',
          onValidValue: (val) => vm.updateAmount(val, isBase: true),
        ),
        const SizedBox(height: 16),
        CurrencyInputField(
          controller: _convertedController,
          focusNode: _convertedFocus,
          label: 'Valor em ${vm.targetCurrency}',
          onValidValue: (val) => vm.updateAmount(val, isBase: false),
        ),
      ],
    );
  }
}