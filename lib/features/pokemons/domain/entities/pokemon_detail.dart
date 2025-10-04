class PokemonDetail {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final String description;
  final double weight;
  final double height;
  final String category;
  final String ability;
  final PokemonGender gender;
  final List<String> weaknesses;
  final PokemonStats stats;

  PokemonDetail({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.description,
    required this.weight,
    required this.height,
    required this.category,
    required this.ability,
    required this.gender,
    required this.weaknesses,
    required this.stats,
  });

  String get number => 'N°${id.toString().padLeft(3, '0')}';
  String get capitalizedName => name[0].toUpperCase() + name.substring(1);
  String get formattedWeight => '${weight} kg';
  String get formattedHeight => '${height} m';
}

class PokemonGender {
  final double male;
  final double female;

  PokemonGender({required this.male, required this.female});
}

class PokemonStats {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  PokemonStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });
}