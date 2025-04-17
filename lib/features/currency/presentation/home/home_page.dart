import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/injection.dart';
import '../home/home_view_model.dart';
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CurrencyComparisonDropdown(
                    comparisons: viewModel.comparisons,
                    selected: viewModel.selectedComparison,
                    onSelect: viewModel.selectComparison,
                  ),
                ],
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
