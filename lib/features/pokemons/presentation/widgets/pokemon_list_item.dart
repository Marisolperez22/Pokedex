import 'package:flutter/material.dart';
import '../../../onboarding/domain/entities/pokemon_entity/pokemon_entity.dart';
import 'package:go_router/go_router.dart';

class PokemonListItem extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/pokemon/${pokemon.name}'),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Row(
          children: [
            // Left: info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('#${pokemon.id == 0 ? '--' : pokemon.id.toString()}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(pokemon.name, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: pokemon.types.map((t) => Chip(label: Text(t))).toList(),
                  )
                ],
              ),
            ),
            // Right: image
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: pokemon.imageUrl.isNotEmpty
                  ? Image.network(pokemon.imageUrl, width: 72, height: 72, fit: BoxFit.cover)
                  : Container(width: 72, height: 72, color: Colors.grey[200]),
            )
          ],
        ),
      ),
    );
  }
}
