class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final String imgUrl;
  final int height;
  final int weight;
  final int baseExperience;
  final List<String> abilities;
  final Map<String, String> stats;
  // final List<String> evolutions;
  Pokemon({
    // required this.evolutions,
    required this.imgUrl,
    required this.name,
    required this.types,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.abilities,
    required this.stats,
    required this.id,
  });
}
