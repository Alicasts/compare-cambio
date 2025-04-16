import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/injection.dart';
import '../../domain/model/available_comparison.dart';
import '../home/home_view_model.dart';
import '../widgets/currency_comparison_dropdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
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
                : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CurrencyComparisonDropdown(
                    comparisons: viewModel.comparisons,
                    selected: viewModel.selectedComparison,
                    onSelect: viewModel.selectComparison,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
