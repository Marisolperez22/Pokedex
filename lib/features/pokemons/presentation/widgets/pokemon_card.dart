import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/pokemon_constants.dart';
import '../../domain/entities/pokemon.dart';
import '../providers/favorite_provider.dart';

class PokemonCard extends ConsumerWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeStyle =
        PokemonConstants.typeStyles[pokemon.primaryType] ??
        PokemonConstants.typeStyles['Normal']!;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),

          color: typeStyle.color.withOpacity(0.5),
        ),
        child: Row(
          children: [
            // Contenedor de imagen con fondo y asset
            // Información del Pokémon
            Expanded(flex: 1, child: _buildPokemonInfo()),
            SizedBox(width: 20),
            // Corazón de favoritos
            // const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: _buildPokemonImageContainer(typeStyle, ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonImageContainer(
    PokemonTypeStyle typeStyle,
    WidgetRef ref,
  ) {
    return Stack(
      children: [
        // Fondo circular con color del tipo
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: typeStyle.color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // Asset image del tipo (detrás del Pokémon)
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                typeStyle.assetImage,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        // Imagen del Pokémon
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.network(
                pokemon.imageUrl,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.catching_pokemon,
                    color: typeStyle.color,
                    size: 40,
                  );
                },
              ),
            ),
          ),
        ),
        Positioned(left: 70, child: _buildFavoriteButton(ref)),
      ],
    );
  }

  Widget _buildPokemonInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Número
          Text(
            pokemon.number,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          // Nombre
          Text(
            pokemon.capitalizedName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          // Tipos
          _buildTypeChips(),
        ],
      ),
    );
  }

  Widget _buildTypeChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: pokemon.types.map((type) {
        final typeStyle =
            PokemonConstants.typeStyles[type] ??
            PokemonConstants.typeStyles['Normal']!;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: typeStyle.color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: typeStyle.color.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            type,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFavoriteButton(WidgetRef ref) {
    return IconButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
      icon: Icon(
        pokemon.isFavorite ? Icons.favorite : Icons.favorite_border,
        color: pokemon.isFavorite ? Colors.red : Colors.white,
        size: 28,
      ),
      onPressed: () {
        ref.read(favoritePokemonsProvider.notifier).toggleFavorite(pokemon.id);
      },
    );
  }
}
