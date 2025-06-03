import 'package:flutter/material.dart';
import 'package:poke_app/domain/entities/pokemon.dart';
import 'package:poke_app/presentation/screens/helpers/color_type.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final BoxDecoration decoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        const BoxShadow(
          color: Colors.black54,
          blurRadius: 5,
          offset: Offset(0, 5),
        ),
      ],
    );

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => _PokemonDialog(pokemon: pokemon),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: DecoratedBox(
          decoration: decoration,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Column(
              children: [
                const SizedBox(height: 10),

                Image.network(
                  pokemon.imgUrl,
                  scale: 0.5,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black54),
                      );
                    }
                    return child;
                  },
                ),

                Text(
                  pokemon.name.toUpperCase(),
                  style: textStyle.labelSmall!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...pokemon.types.map(
                      (type) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chip(
                          label: Text(
                            type,
                            style: textStyle.bodyMedium!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: typeColor(type),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PokemonDialog extends StatelessWidget {
  final Pokemon pokemon;

  const _PokemonDialog({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        pokemon.name.toUpperCase(),
        textAlign: TextAlign.center,
        style: textStyle.titleLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen
            Image.network(pokemon.imgUrl, width: 100, height: 100),

            const SizedBox(height: 16),

            // Abilities
            Text('Abilities', style: textStyle.titleMedium),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              children: pokemon.abilities.map((ability) {
                return Chip(
                  label: Text(ability),
                  backgroundColor: Colors.grey.shade300,
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Stats
            Text('Stats', style: textStyle.titleMedium),
            const SizedBox(height: 8),
            Column(
              children: pokemon.stats.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      SizedBox(width: 70, child: Text(entry.key)),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: (int.parse(entry.value) / 200).clamp(0.0, 1.0),
                          backgroundColor: Colors.grey,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(entry.value),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cerrar'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
