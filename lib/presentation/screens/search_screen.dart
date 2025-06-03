import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/presentation/providers/pokemon_provider.dart';
import 'package:poke_app/presentation/screens/widget/custom_app_bar.dart';
import 'package:poke_app/presentation/screens/widget/pokemon_card.dart';

class SearchScreen extends StatelessWidget {
  static const String name = 'search_screen';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Search'),
      body: _MessageFieldBox(),
    );
  }
}

class _MessageFieldBox extends ConsumerStatefulWidget {
  const _MessageFieldBox();

  @override
  _MessageFieldBoxState createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends ConsumerState<_MessageFieldBox> {
  final TextEditingController textController = TextEditingController();
  final focusNode = FocusNode();

  void sendMessage() {
    final text = textController.text.trim();

    if (text.isEmpty) return;

    ref.read(pokemonProvider.notifier).loadPokemon(text.toLowerCase());
    textController.clear();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = ref.watch(pokemonProvider);

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    var inputDecoration = InputDecoration(
      hintText: 'Write a pokemon',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: sendMessage,
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          TextFormField(
            onTapOutside: (event) {
              focusNode.unfocus();
            },
            focusNode: focusNode,
            controller: textController,
            decoration: inputDecoration,
            onFieldSubmitted: (value) {
              sendMessage();
            },
          ),
          SizedBox(height: 30),
          if (pokemon.isNotEmpty) PokemonCard(pokemon: pokemon[0]),
        ],
      ),
    );
  }
}
