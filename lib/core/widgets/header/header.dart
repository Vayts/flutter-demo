import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String route;
  final IconData icon;

  const Header({super.key, required this.route, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor : Colors.white,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(icon),
        onPressed: () {
          Navigator.of(context).pushNamed(route);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(45.0);
}