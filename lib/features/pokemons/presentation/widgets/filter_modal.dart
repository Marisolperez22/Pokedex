import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/pokemon_constants.dart';
import '../providers/filter_providers.dart';

class FilterModal extends ConsumerStatefulWidget {
  const FilterModal({super.key});

  @override
  ConsumerState<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends ConsumerState<FilterModal> {
  late List<String> _tempSelectedTypes;

  @override
  void initState() {
    super.initState();
    _tempSelectedTypes = List.from(ref.read(selectedTypesProvider));
  }

  @override
  Widget build(BuildContext context) {
    final availableTypes = ref.watch(availableTypesProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          _buildHeader(),
          const SizedBox(height: 24),

          // Dropdown de Tipos
          _buildTypesDropdown(availableTypes),
          const SizedBox(height: 32),

          // Botones de acción
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => _cancelFilters(context),
            ),
          ],
        ),
        Text(
          'Filtra por tus preferencias',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTypesDropdown(List<String> availableTypes) {
    return ExpansionTile(
      title: const Text(
        'Tipo',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),

      initiallyExpanded: false,
      children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 300),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: availableTypes.length,
            itemBuilder: (context, index) {
              final type = availableTypes[index];
              final isSelected = _tempSelectedTypes.contains(type);
              return _buildTypeCheckbox(type, isSelected);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTypeCheckbox(String type, bool isSelected) {
    final typeStyle =
        PokemonConstants.typeStyles[type] ??
        PokemonConstants.typeStyles['Normal']!;

    return CheckboxListTile(
      title: Text(type),
      value: isSelected,
      onChanged: (bool? value) {
        _toggleTypeSelection(type);
      },
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: typeStyle.color,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => _applyFilters(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E88E5),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Aplicar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Botón Cancelar
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _cancelFilters(context),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(color: Colors.grey[400]!),
                ),
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),

        // Botón Aplicar
      ],
    );
  }

  void _toggleTypeSelection(String type) {
    setState(() {
      if (_tempSelectedTypes.contains(type)) {
        _tempSelectedTypes.remove(type);
      } else {
        _tempSelectedTypes.add(type);
      }
    });
  }

  void _cancelFilters(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _applyFilters(BuildContext context) {
    ref.read(selectedTypesProvider.notifier).state = List.from(
      _tempSelectedTypes,
    );
    Navigator.of(context).pop();
  }
}
