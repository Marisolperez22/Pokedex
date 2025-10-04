import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filter_providers.dart';
import 'filter_modal.dart';

class FilterButton extends ConsumerWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTypes = ref.watch(selectedTypesProvider);
    final hasActiveFilters = selectedTypes.isNotEmpty;

    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Icons.filter_alt,
            color: hasActiveFilters ? Colors.red : Colors.green,
          ),
          onPressed: () => _showFilterModal(context),
        ),
        if (hasActiveFilters)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 12,
                minHeight: 12,
              ),
            ),
          ),
      ],
    );
  }

  void _showFilterModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: const FilterModal(),
        ),
      ),
    );
  }
}