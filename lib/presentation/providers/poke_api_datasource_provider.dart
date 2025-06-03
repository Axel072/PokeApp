import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/domain/datasources/poke_datasource.dart';
import 'package:poke_app/infraestructure/datasources/poke_api_datasource.dart';

final pokeApiProvider = Provider<PokeDatasource>((ref) {
  return PokeApiDatasource();
});
