import 'package:compare_cambio/features/currency/presentation/home/viewmodel/currency_conversion_view_model.dart';
import 'package:compare_cambio/features/currency/presentation/home/widgets/comparison_chart_widget.dart';
import 'package:compare_cambio/features/currency/presentation/home/widgets/currency_conversion_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/injection.dart';
import 'viewmodel/home_view_model.dart';
import 'widgets/currency_comparison_dropdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final viewModel = getIt<HomeViewModel>();
        viewModel.fetchComparisons();
        return viewModel;
      },
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(title: const Text('Selecionar Comparação')),
            body: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  alignment: viewModel.selectedComparison == null
                      ? Alignment.center
                      : Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CurrencyComparisonDropdown(
                            comparisons: viewModel.comparisons,
                            selected: viewModel.selectedComparison,
                            onSelect: viewModel.selectComparison,
                          ),
                          const SizedBox(height: 40),
                          if (viewModel.selectedComparison != null)
                            ChangeNotifierProvider.value(
                              value: viewModel.currencyConversionViewModel,
                              child: const CurrencyConversionWidget(),
                            ),
                          const SizedBox(height: 40),
                          ComparisonChartWidget(history: viewModel.comparisonHistory),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
