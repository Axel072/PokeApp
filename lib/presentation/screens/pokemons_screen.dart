import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/presentation/providers/pokemon_provider.dart';
import 'package:poke_app/presentation/screens/widget/custom_app_bar.dart';
import 'package:poke_app/presentation/screens/widget/pokemon_card.dart';

class PokemonsScreen extends StatelessWidget {
  static const String name = 'pokemon_screen';
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pokemons'),
      body: _PokemonScrollView(),
    );
  }
}

class _PokemonScrollView extends ConsumerStatefulWidget {
  const _PokemonScrollView();

  @override
  _PokemonScrollViewState createState() => _PokemonScrollViewState();
}

class _PokemonScrollViewState extends ConsumerState<_PokemonScrollView> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <=
              (scrollController.position.pixels + 100) &&
          !ref.watch(pokemonsProvider.notifier).isLoading) {
        ref.watch(pokemonsProvider.notifier).loadMorePokemons();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ref.watch(pokemonsProvider).isEmpty) {
      ref.watch(pokemonsProvider.notifier).loadMorePokemons();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemons = ref.watch(pokemonsProvider);
    final isLoading = ref.watch(pokemonsProvider.notifier).isLoading;

    return Stack(
      children: [
        ListView.builder(
          controller: scrollController,
          physics: BouncingScrollPhysics(),
          itemCount: pokemons.length,
          itemBuilder: (BuildContext context, int index) {
            final pokemon = pokemons[index];
            return PokemonCard(pokemon: pokemon);
          },
        ),

        isLoading
            ? Center(
                child: Text(
                  'Catching the pokemons...',
                  textScaler: TextScaler.linear(2),
                ),
              )
            : SizedBox(),

        Positioned(
          right: 5,
          bottom: 5,
          child: Column(
            children: [
              IconButton(
                color: Colors.red,
                onPressed: () {
                  scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: Duration(
                      milliseconds: (scrollController.position.pixels / 10)
                          .toInt(),
                    ),
                    curve: Curves.easeOut,
                  );
                },
                icon: Icon(Icons.arrow_upward),
              ),
              IconButton(
                onPressed: () {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: Duration(
                      milliseconds:
                          (scrollController.position.maxScrollExtent / 10)
                              .toInt(),
                    ),
                    curve: Curves.easeOut,
                  );
                },
                icon: Icon(Icons.arrow_downward, color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
