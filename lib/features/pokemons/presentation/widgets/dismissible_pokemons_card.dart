import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/pokemons/presentation/widgets/pokemon_card.dart';

import '../../domain/entities/pokemon.dart';
import '../providers/favorite_provider.dart';



class DismissiblePokemonCard extends ConsumerWidget {
  final Pokemon pokemon;
  final bool isDismissible;

  const DismissiblePokemonCard({
    super.key,
    required this.pokemon,
    this.isDismissible = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!isDismissible) {
      return PokemonCard(pokemon: pokemon);
    }

    return Dismissible(
      key: Key('favorite_${pokemon.id}'),
      direction: DismissDirection.endToStart,
      background: _buildDismissBackground(),
      secondaryBackground: _buildDismissBackground(),
      confirmDismiss: (direction) async {
        // Mostrar diálogo de confirmación
        return await _showDeleteConfirmationDialog(context);
      },
      onDismissed: (direction) {
        // Eliminar de favoritos usando ref.read()
        ref.read(favoritePokemonsProvider.notifier).removeFavorite(pokemon.id);
        
        // Mostrar snackbar de confirmación
        _showRemovedSnackbar(context, pokemon, ref);
      },
      child: PokemonCard(pokemon: pokemon),
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 50),
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }

  Future<bool?> _showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Eliminar de favoritos'),
        content: Text(
          '¿Estás seguro de que quieres eliminar a ${pokemon.capitalizedName} de tus favoritos?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  void _showRemovedSnackbar(BuildContext context, Pokemon pokemon, WidgetRef ref) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${pokemon.capitalizedName} eliminado de favoritos'),
        action: SnackBarAction(
          label: 'Deshacer',
          textColor: Colors.yellow,
          onPressed: () {
            // Re-agregar a favoritos usando ref.read()
            ref.read(favoritePokemonsProvider.notifier).toggleFavorite(pokemon.id);
          },
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}