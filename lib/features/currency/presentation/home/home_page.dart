import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/injection.dart';
import '../../domain/model/available_currency.dart';
import '../home/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (_) {
        final viewModel = getIt<HomeViewModel>();
        viewModel.fetchCurrencies();
        return viewModel;
      },
      child: Consumer<HomeViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(title: const Text('Selecionar Moedas')),
            body: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  DropdownSearch<AvailableCurrency>(
                    items: viewModel.currencies,
                    selectedItem: viewModel.selectedBase,
                    itemAsString: (AvailableCurrency currency) => currency.label,
                    onChanged: viewModel.selectBaseCurrency,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: 'Moeda base',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                    popupProps: const PopupProps.menu(
                      showSearchBox: true,
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownSearch<AvailableCurrency>(
                    items: viewModel.currencies
                        .where((c) => c.code != viewModel.selectedBase?.code)
                        .toList(),
                    selectedItem: viewModel.selectedTarget,
                    itemAsString: (AvailableCurrency currency) => currency.label,
                    onChanged: viewModel.selectTargetCurrency,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        labelText: 'Moeda de comparação',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                    popupProps: const PopupProps.menu(
                      showSearchBox: true,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
