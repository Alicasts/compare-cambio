

import 'package:diacritic/diacritic.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../domain/model/available_comparison.dart';

class CurrencyComparisonDropdown extends StatelessWidget {
  final List<AvailableComparison> comparisons;
  final AvailableComparison? selected;
  final void Function(AvailableComparison?) onSelect;

  const CurrencyComparisonDropdown({
    super.key,
    required this.comparisons,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<AvailableComparison>(
      items: comparisons,
      selectedItem: selected,
      itemAsString: (c) => c.label,
      onChanged: onSelect,
      filterFn: (item, filter) {
        return removeDiacritics(item.label.toLowerCase())
            .contains(removeDiacritics(filter.toLowerCase()));
      },
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: 'Par de Moedas',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
      popupProps: const PopupProps.menu(
        showSearchBox: true,
      ),
    );
  }
}