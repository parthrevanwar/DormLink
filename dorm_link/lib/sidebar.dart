import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            // decoration: background,
            decoration: BoxDecoration(
              color: Color.fromARGB(233, 186, 252, 255),
            ),
            accountName: Text(
              'BH-1',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            accountEmail: Text(
              "IIIT-Allahabad",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Friends'),
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.alarm),
            title: const Text('Alarm'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
