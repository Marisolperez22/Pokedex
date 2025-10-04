class PokemonDetailResponse {
  final int id;
  final String name;
  final Sprites sprites;
  final List<TypeSlot> types;
  final List<StatSlot> stats;
  final double weight;
  final double height;
  final List<AbilitySlot> abilities;
  final List<Species> forms;

  PokemonDetailResponse({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
    required this.stats,
    required this.weight,
    required this.height,
    required this.abilities,
    required this.forms,
  });

  factory PokemonDetailResponse.fromJson(Map<String, dynamic> json) {
    return PokemonDetailResponse(
      id: json['id'],
      name: json['name'],
      sprites: Sprites.fromJson(json['sprites']),
      types: (json['types'] as List)
          .map((type) => TypeSlot.fromJson(type))
          .toList(),
      stats: (json['stats'] as List)
          .map((stat) => StatSlot.fromJson(stat))
          .toList(),
      weight: (json['weight'] ?? 0) / 10.0, // Convertir a kg
      height: (json['height'] ?? 0) / 10.0, // Convertir a metros
      abilities: (json['abilities'] as List)
          .map((ability) => AbilitySlot.fromJson(ability))
          .toList(),
      forms: (json['forms'] as List)
          .map((form) => Species.fromJson(form))
          .toList(),
    );
  }
}

class Sprites {
  final String frontDefault;
  final String? frontShiny;
  final String? backDefault;
  final String? backShiny;

  Sprites({
    required this.frontDefault,
    this.frontShiny,
    this.backDefault,
    this.backShiny,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      frontDefault: json['front_default'] ?? '',
      frontShiny: json['front_shiny'],
      backDefault: json['back_default'],
      backShiny: json['back_shiny'],
    );
  }
}

class TypeSlot {
  final int slot;
  final PokemonType type;

  TypeSlot({
    required this.slot,
    required this.type,
  });

  factory TypeSlot.fromJson(Map<String, dynamic> json) {
    return TypeSlot(
      slot: json['slot'],
      type: PokemonType.fromJson(json['type']),
    );
  }
}

class PokemonType {
  final String name;
  final String url;

  PokemonType({
    required this.name,
    required this.url,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      name: json['name'],
      url: json['url'],
    );
  }

  String get capitalized => name[0].toUpperCase() + name.substring(1);
}

class StatSlot {
  final int baseStat;
  final int effort;
  final Species stat;

  StatSlot({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory StatSlot.fromJson(Map<String, dynamic> json) {
    return StatSlot(
      baseStat: json['base_stat'],
      effort: json['effort'],
      stat: Species.fromJson(json['stat']),
    );
  }
}

class AbilitySlot {
  final bool isHidden;
  final int slot;
  final Species ability;

  AbilitySlot({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  factory AbilitySlot.fromJson(Map<String, dynamic> json) {
    return AbilitySlot(
      isHidden: json['is_hidden'],
      slot: json['slot'],
      ability: Species.fromJson(json['ability']),
    );
  }
}

class Species {
  final String name;
  final String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json['name'],
      url: json['url'],
    );
  }
}