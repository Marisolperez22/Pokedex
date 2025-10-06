/* import 'package:flutter/material.dart';
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
            Icons.tune,
            color: hasActiveFilters ? Colors.deepPurple : Colors.black,
          ),
          onPressed: () => _showFilterModal(context),
        ),
        if (hasActiveFilters)
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 2, minHeight: 2),
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
      builder: (context) => BottomSheet(
      onClosing: () {
        
      },
        builder: (context) => const FilterModal(),
      ),
    );
  }
}
 */