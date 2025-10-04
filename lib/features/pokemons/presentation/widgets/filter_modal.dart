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
    // Inicializar con los tipos actualmente seleccionados
    _tempSelectedTypes = List.from(ref.read(selectedTypesProvider));
  }

  @override
  Widget build(BuildContext context) {
    final availableTypes = ref.watch(availableTypesProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          _buildHeader(),
          const SizedBox(height: 24),
          
          // Título de tipos
          _buildTypesTitle(),
          const SizedBox(height: 16),
          
          // Grid de tipos
          _buildTypesGrid(availableTypes),
          const SizedBox(height: 32),
          
          // Botones de acción
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      children: [
        Icon(
          Icons.filter_alt,
          color: Colors.red,
          size: 28,
        ),
        SizedBox(width: 12),
        Text(
          'Filtra por tus preferencias',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildTypesTitle() {
    return const Text(
      'Tipo',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTypesGrid(List<String> availableTypes) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 2.5,
      ),
      itemCount: availableTypes.length,
      itemBuilder: (context, index) {
        final type = availableTypes[index];
        final isSelected = _tempSelectedTypes.contains(type);
        
        return _buildTypeChip(type, isSelected);
      },
    );
  }

  Widget _buildTypeChip(String type, bool isSelected) {
    final typeStyle = PokemonConstants.typeStyles[type] ?? 
        PokemonConstants.typeStyles['Normal']!;

    return GestureDetector(
      onTap: () => _toggleTypeSelection(type),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? typeStyle.color : Colors.grey[100],
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isSelected ? typeStyle.darkColor : Colors.grey[300]!,
            width: 2,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: typeStyle.color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ] : null,
        ),
        child: Center(
          child: Text(
            type,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        // Botón Cancelar
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
        const SizedBox(width: 12),
        
        // Botón Aplicar
        Expanded(
          child: ElevatedButton(
            onPressed: () => _applyFilters(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
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
    // Cerrar el modal sin aplicar cambios
    Navigator.of(context).pop();
  }

  void _applyFilters(BuildContext context) {
    // Aplicar los filtros seleccionados al provider
    ref.read(selectedTypesProvider.notifier).state = List.from(_tempSelectedTypes);
    
    // Cerrar el modal
    Navigator.of(context).pop();
  }
}