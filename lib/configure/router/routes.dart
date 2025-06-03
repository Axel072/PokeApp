import 'package:go_router/go_router.dart';
import 'package:poke_app/presentation/screens.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/search',
      name: SearchScreen.name,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/pokemons',
      name: PokemonsScreen.name,
      builder: (context, state) => const PokemonsScreen(),
    ),
    GoRoute(
      path: '/generations',
      name: GenerationsScreen.name,
      builder: (context, state) => const GenerationsScreen(),
    ),
  ],
);
