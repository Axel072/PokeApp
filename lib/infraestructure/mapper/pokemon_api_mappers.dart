import 'package:poke_app/domain/entities/pokemon.dart';

Map<String, String> statsMapper(List stats) {
  Map<String, String> statsMap = {};
  for (var stat in stats) {
    final baseStat = stat['base_stat'];
    final nameStat = stat['stat']['name'];
    statsMap[nameStat] = baseStat.toString();
  }
  return statsMap;
}

class PokemonApiMappers {
  static List<String> pokemonsToList(Map<String, dynamic> json) {
    final List<String> pokemons = [];
    for (final pokemon in json['results']) {
      pokemons.add(pokemon['name']);
    }
    return pokemons;
  }

  static List<String> generationToList(Map<String, dynamic> json) {
    final List<String> pokemons = [];
    for (final pokemon in json['pokemon_species']) {
      pokemons.add(pokemon['name']);
    }
    return pokemons;
  }

  static Pokemon jsonToPokemon(Map<String, dynamic> json) => Pokemon(
    // evolutions: evolutions,
    imgUrl:
        json['sprites']?['front_default'] ??
        'https://nftcalendar.io/storage/uploads/2022/02/21/image-not-found_0221202211372462137974b6c1a.png',
    name: json['name'] ?? '',
    types:
        (json['types'] as List<dynamic>?)
            ?.map((e) => e['type']?['name'] as String)
            .toList() ??
        [],
    height: json['height'] ?? 1,
    weight: json['weight'] ?? 1,
    baseExperience: json['base_experience'] ?? 1,
    abilities:
        (json['abilities'] as List<dynamic>?)
            ?.map((e) => e['ability']['name'] as String)
            .toList() ??
        [],
    stats: statsMapper(json['stats']),
    id: json['id'],
  );
}
