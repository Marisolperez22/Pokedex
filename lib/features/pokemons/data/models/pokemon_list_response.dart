class PokemonListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonListItem> results;

  PokemonListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    return PokemonListResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List)
          .map((item) => PokemonListItem.fromJson(item))
          .toList(),
    );
  }
}

class PokemonListItem {
  final String name;
  final String url;

  PokemonListItem({
    required this.name,
    required this.url,
  });

  factory PokemonListItem.fromJson(Map<String, dynamic> json) {
    return PokemonListItem(
      name: json['name'],
      url: json['url'],
    );
  }

  int get id {
    final segments = url.split('/');
    return int.parse(segments[segments.length - 2]);
  }
}