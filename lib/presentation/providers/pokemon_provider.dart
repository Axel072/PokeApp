import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/domain/datasources/poke_datasource.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/presentation/providers/poke_api_datasource_provider.dart';

final pokemonsProvider = StateNotifierProvider<PokemonNotifier, List<Pokemon>>(
  (ref) => PokemonNotifier(datasource: ref.watch(pokeApiProvider)),
);

final pokemonProvider = StateNotifierProvider<PokemonNotifier, List<Pokemon>>(
  (ref) => PokemonNotifier(datasource: ref.watch(pokeApiProvider)),
);

final generationProvider =
    StateNotifierProvider<PokemonNotifier, List<Pokemon>>(
      (ref) => PokemonNotifier(datasource: ref.watch(pokeApiProvider)),
    );

class PokemonNotifier extends StateNotifier<List<Pokemon>> {
  final PokeDatasource datasource;
  int currentOffset = 0;
  bool isLoading = false;

  PokemonNotifier({required this.datasource}) : super([]);

  Future<void> loadPokemon(String pokemon) async {
    final newPokemon = await datasource.getPokemon(pokemon);
    state = [newPokemon];
  }

  Future<void> loadGeneration(int generation) async {
    final newPokemons = await datasource.getGeneration(generation: generation);
    state = [...newPokemons];
  }

  Future<void> loadMorePokemons() async {
    if (isLoading) return;
    isLoading = true;
    final newPokemons = await datasource.getPokemonPage(offset: currentOffset);
    state = [...state, ...newPokemons];
    currentOffset += 20;
    isLoading = false;
  }
}
