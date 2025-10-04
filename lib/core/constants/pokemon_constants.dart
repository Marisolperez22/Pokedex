import 'dart:ui';

class PokemonConstants {
  static const Map<String, PokemonTypeStyle> typeStyles = {
    'Grass': PokemonTypeStyle(
      color: Color(0xFF8BC34A),
      assetImage: 'assets/images/grass.png',
      darkColor: Color(0xFF8BC34A),
    ),
    'Poison': PokemonTypeStyle(
      color: Color(0xFF9C27B0),
      assetImage: 'assets/images/poison.png',
      darkColor: Color(0xFF7B1FA2),
    ),
    'Fire': PokemonTypeStyle(
      color: Color(0xFFFF9800),
      assetImage: 'assets/images/fire.png',
      darkColor: Color(0xFFF57C00),
    ),
    'Water': PokemonTypeStyle(
      color: Color(0xFF2196F3),
      assetImage: 'assets/images/water.png',
      darkColor: Color(0xFF1976D2),
    ),
    'Electric': PokemonTypeStyle(
      color: Color(0xFFFFC107),
      assetImage: 'assets/images/electric.png',
      darkColor: Color(0xFFFFA000),
    ),
    'Ice': PokemonTypeStyle(
      color: Color(0xFF00BCD4),
      assetImage: 'assets/images/ice.png',
      darkColor: Color(0xFF0097A7),
    ),
    'Fighting': PokemonTypeStyle(
      color: Color(0xFFF44336),
      assetImage: 'assets/images/fighting.png',
      darkColor: Color(0xFFD32F2F),
    ),
    'Ground': PokemonTypeStyle(
      color: Color(0xFF795548),
      assetImage: 'assets/images/ground.png',
      darkColor: Color(0xFF5D4037),
    ),
    'Flying': PokemonTypeStyle(
      color: Color(0xFF3F51B5),
      assetImage: 'assets/images/flying.png',
      darkColor: Color(0xFF303F9F),
    ),
    'Psychic': PokemonTypeStyle(
      color: Color(0xFFE91E63),
      assetImage: 'assets/images/psychic.png',
      darkColor: Color(0xFFC2185B),
    ),
    'Bug': PokemonTypeStyle(
      color: Color(0xFF8BC34A),
      assetImage: 'assets/images/bug.png',
      darkColor: Color(0xFF689F38),
    ),
    'Rock': PokemonTypeStyle(
      color: Color(0xFF607D8B),
      assetImage: 'assets/images/rock.png',
      darkColor: Color(0xFF455A64),
    ),
    'Ghost': PokemonTypeStyle(
      color: Color(0xFF673AB7),
      assetImage: 'assets/images/ghost.png',
      darkColor: Color(0xFF512DA8),
    ),
    'Dragon': PokemonTypeStyle(
      color: Color(0xFF3F51B5),
      assetImage: 'assets/images/dragon.png',
      darkColor: Color(0xFF303F9F),
    ),
    'Dark': PokemonTypeStyle(
      color: Color(0xFF424242),
      assetImage: 'assets/images/dark.png',
      darkColor: Color(0xFF212121),
    ),
    'Steel': PokemonTypeStyle(
      color: Color(0xFF607D8B),
      assetImage: 'assets/images/steel.png',
      darkColor: Color(0xFF455A64),
    ),
    'Fairy': PokemonTypeStyle(
      color: Color(0xFFE91E63),
      assetImage: 'assets/images/fairy.png',
      darkColor: Color(0xFFC2185B),
    ),
    'Normal': PokemonTypeStyle(
      color: Color(0xFF9E9E9E),
      assetImage: 'assets/images/normal.png',
      darkColor: Color(0xFF757575),
    ),
  };
}

class PokemonTypeStyle {
  final Color color;
  final String assetImage;
  final Color darkColor;

  const PokemonTypeStyle({
    required this.color,
    required this.assetImage,
    required this.darkColor,
  });
}