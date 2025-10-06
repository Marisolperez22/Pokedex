import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/pokemon_notifier.dart';
import 'filter_button.dart';

class PokemonSearchBar extends ConsumerWidget {
  const PokemonSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              onChanged: (value) {
                ref.read(pokemonSearchProvider.notifier).state = value;
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: FilterButton()),
        ],
      ),
    );
  }
}