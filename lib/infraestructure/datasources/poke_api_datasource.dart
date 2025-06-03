import 'package:dio/dio.dart';
import 'package:poke_app/domain/datasources/poke_datasource.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/infraestructure/mapper/pokemon_api_mappers.dart';

class PokeApiDatasource extends PokeDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/'));
  @override
  Future<List<Pokemon>> getGeneration({int generation = 1}) async {
    final request = await dio.get('generation/${generation}');
    final list = PokemonApiMappers.generationToList(request.data);
    final List<Pokemon> pokemons = [];
    for (final pokemon in list) {
      final pokemonFound = await getPokemon(pokemon);
      pokemons.add(pokemonFound);
    }
    return pokemons;
  }

  @override
  Future<List<Pokemon>> getPokemonPage({int offset = 0}) async {
    final request = await dio.get('pokemon?limit=20&offset=$offset');
    final list = PokemonApiMappers.pokemonsToList(request.data);
    final List<Pokemon> pokemons = [];
    for (final pokemon in list) {
      final pokemonFound = await getPokemon(pokemon);
      pokemons.add(pokemonFound);
    }
    return pokemons;
  }

  @override
  Future<Pokemon> getPokemon(String nameOrId) async {
    try {
      final response = await dio.get('pokemon/$nameOrId');
      return PokemonApiMappers.jsonToPokemon(response.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        final fallback = await dio.get('pokemon/ditto');
        return PokemonApiMappers.jsonToPokemon(fallback.data);
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<List<String>> getEvolutionChain(String nameOrId) {
    return throw Exception();
  }
}
