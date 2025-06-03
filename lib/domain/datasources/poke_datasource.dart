import 'package:poke_app/domain/entities/pokemon.dart';

abstract class PokeDatasource {
  Future<List<Pokemon>> getGeneration({int generation = 1});
  Future<List<Pokemon>> getPokemonPage({int offset = 0});
  Future<Pokemon> getPokemon(String nameOrId);
  Future<List<String>> getEvolutionChain(String nameOrId);
}
