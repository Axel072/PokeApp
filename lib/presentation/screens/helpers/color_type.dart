import 'package:flutter/material.dart';

Color typeColor(String type) {
  switch (type.toLowerCase()) {
    case 'fire':
      return Colors.deepOrange;
    case 'water':
      return Colors.blueAccent;
    case 'grass':
      return Colors.green;
    case 'electric':
      return Colors.amber;
    case 'poison':
      return Colors.purple;
    case 'rock':
      return const Color.fromARGB(255, 72, 46, 36);
    case 'bug':
      return Colors.lightGreen;
    case 'ground':
      return const Color.fromARGB(255, 141, 127, 91);
    case 'flying':
      return const Color(0xFF81B9EF);
    case 'fairy':
      return const Color(0xFFE29FE6);
    case 'dragon':
      return const Color.fromARGB(255, 122, 84, 209);
    case 'fighting':
      return const Color(0xFFC03028);
    case 'psychic':
      return const Color(0xFFF85888);
    case 'steel':
      return const Color(0xFFB8B8D0);
    case 'normal':
      return const Color(0xFFA8A878);
    case 'ice':
      return const Color(0xFF98D8D8);
    case 'ghost':
      return const Color(0xFF705898);
    case 'dark':
      return const Color.fromARGB(255, 25, 25, 26);
    default:
      return Colors.grey;
  }
}
