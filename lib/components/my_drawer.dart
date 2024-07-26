import 'package:flutter/material.dart';
import 'package:food/components/my_drawer_tile.dart';
import 'package:food/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // App Logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // Home List Tile
          MyDrawerTile(
            text: " H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          // Setting List Tile
          MyDrawerTile(
              text: " S E T T I N G",
              icon: Icons.settings,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              }),
          // logout List Tile
          const Spacer(),
          MyDrawerTile(
            text: " L O G O U T",
            icon: Icons.logout,
            onTap: () {},
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
