import 'package:flutter/material.dart';

class MenuItems {
  final String name;
  final String path;
  final IconData icon;
  final Color color;
  const MenuItems({
    required this.name,
    required this.path,
    required this.icon,
    required this.color,
  });
}

const List<MenuItems> menu = [
  MenuItems(
    name: 'Search',
    path: '/search',
    icon: Icons.search,
    color: Colors.blueAccent,
  ),
  MenuItems(
    name: 'Pokemons',
    path: '/pokemons',
    icon: Icons.catching_pokemon_outlined,
    color: Colors.redAccent,
  ),
  MenuItems(
    name: 'Generations',
    path: '/generations',
    icon: Icons.timeline_outlined,
    color: Colors.greenAccent,
  ),
  MenuItems(name: 'Trivia', path: '/', icon: Icons.quiz, color: Colors.black38),
  MenuItems(
    name: 'Favorities',
    path: '/facorities',
    icon: Icons.favorite_rounded,
    color: Colors.red,
  ),
];
