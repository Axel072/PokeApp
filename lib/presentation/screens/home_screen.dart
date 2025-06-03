import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_app/configure/menu/menu_items.dart';
import 'package:poke_app/presentation/screens/widget/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screens';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(title: "My Poke App"),
      body: Stack(
        children: [
          Positioned(
            top: 420,
            left: 40,
            child: Icon(
              Icons.catching_pokemon_rounded,
              size: 550,
              color: const Color.fromARGB(31, 117, 116, 116),
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              final item = menu[index];
              return _CustomButton(menu: item, textStyle: textStyle);
            },
          ),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final TextTheme textStyle;
  final MenuItems menu;
  const _CustomButton({required this.menu, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push(menu.path),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(menu.icon, size: 50, color: menu.color),
                SizedBox(height: 10),
                Text(
                  menu.name,
                  style: textStyle.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
