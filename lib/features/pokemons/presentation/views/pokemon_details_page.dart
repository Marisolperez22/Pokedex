import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/pokemon_constants.dart';
import '../../domain/entities/pokemon_detail.dart';
import '../providers/pokemon_details_provider.dart';

class PokemonDetailPage extends ConsumerWidget {
  final int pokemonId;

  const PokemonDetailPage({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonDetailAsync = ref.watch(pokemonDetailProvider(pokemonId));

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: pokemonDetailAsync.when(
        data: (pokemon) => _buildDetailContent(pokemon, context),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Error cargando Pokémon'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.invalidate(pokemonDetailProvider(pokemonId)),
                child: const Text('Reintentar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailContent(PokemonDetail pokemon, BuildContext context) {
    final primaryType = pokemon.types.isNotEmpty ? pokemon.types[0] : 'Normal';
    final typeStyle = PokemonConstants.typeStyles[primaryType] ?? 
        PokemonConstants.typeStyles['Normal']!;

    return CustomScrollView(
      slivers: [
        // AppBar con gradiente
        SliverAppBar(
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    typeStyle.color.withOpacity(0.8),
                    typeStyle.color.withOpacity(0.4),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Imagen del Pokémon
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Hero(
                        tag: 'pokemon-image-${pokemon.id}',
                        child: Image.network(
                          pokemon.imageUrl,
                          width: 200,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: typeStyle.color,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),

        // Contenido principal
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nombre y número
                _buildNameAndNumber(pokemon),
                const SizedBox(height: 16),
                
                // Tipos
                _buildTypes(pokemon.types),
                const SizedBox(height: 16),
                
                // Descripción
                _buildDescription(pokemon.description),
                const SizedBox(height: 24),
                
                // Estadísticas (Peso, Altura, Categoría, Habilidad)
                _buildStatsGrid(pokemon),
                const SizedBox(height: 24),
                
                // Género
                _buildGender(pokemon.gender),
                const SizedBox(height: 24),
                
                // Debilidades
                _buildWeaknesses(pokemon.weaknesses),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNameAndNumber(PokemonDetail pokemon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
          child: Text(
            pokemon.capitalizedName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          pokemon.number,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildTypes(List<String> types) {
    return Wrap(
      spacing: 8,
      children: types.map((type) {
        final typeStyle = PokemonConstants.typeStyles[type] ?? 
            PokemonConstants.typeStyles['Normal']!;
        
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: typeStyle.color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            type,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black87,
        height: 1.5,
      ),
    );
  }

  Widget _buildStatsGrid(PokemonDetail pokemon) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 3,
      children: [
        _buildStatItem('PESO', pokemon.formattedWeight),
        _buildStatItem('ALTURA', pokemon.formattedHeight),
        _buildStatItem('CATEGORÍA', pokemon.category),
        _buildStatItem('HABILIDAD', pokemon.ability),
      ],
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGender(PokemonGender gender) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'GÉNERO',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildGenderIndicator('Masculino', gender.male, Colors.blue),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildGenderIndicator('Femenino', gender.female, Colors.pink),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderIndicator(String label, double percentage, Color color) {
    return Column(
      children: [
        Text(
          '$percentage%',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage / 100,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildWeaknesses(List<String> weaknesses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Debilidades',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: weaknesses.map((weakness) {
            final typeStyle = PokemonConstants.typeStyles[weakness] ?? 
                PokemonConstants.typeStyles['Normal']!;
            
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: typeStyle.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                weakness,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }


}