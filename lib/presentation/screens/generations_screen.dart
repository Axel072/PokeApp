import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_app/presentation/providers/pokemon_provider.dart';
import 'package:poke_app/presentation/screens/widget/custom_app_bar.dart';
import 'package:poke_app/presentation/screens/widget/pokemon_card.dart';

class GenerationsScreen extends ConsumerStatefulWidget {
  static const String name = 'generations_screen';

  const GenerationsScreen({super.key});

  @override
  ConsumerState<GenerationsScreen> createState() => _GenerationsScreenState();
}

class _GenerationsScreenState extends ConsumerState<GenerationsScreen> {
  int? selectedGeneration;
  final generations = List.generate(9, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    final generation = ref.watch(generationProvider);

    return Scaffold(
      appBar: CustomAppBar(title: 'Generation'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButton<int>(
              hint: const Text('Select generation'),
              value: selectedGeneration,
              isExpanded: true,
              items: generations
                  .map(
                    (gen) => DropdownMenuItem(
                      value: gen,
                      child: Text('Generation $gen'),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value == null) return;
                ref.read(generationProvider.notifier).loadGeneration(value);
              },
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: generation.length,
                itemBuilder: (context, index) {
                  return PokemonCard(pokemon: generation[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
