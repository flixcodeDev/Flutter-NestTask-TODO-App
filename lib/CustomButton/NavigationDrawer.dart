import 'package:flutter/material.dart';

class NavDrawerPage extends StatelessWidget {
  const NavDrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/avater.png'), // Replace with your image asset
                ),
                SizedBox(height: 10),
                Text(
                  'Sandra Adams',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'sandra_a88@gmail.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.folder, color: Colors.purple),
            title: Text('My Files'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Shared with me'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Starred'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Recent'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.offline_pin),
            title: Text('Offline'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.upload_file),
            title: Text('Uploads'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.backup),
            title: Text('Backups'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Trash'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Logout',style: TextStyle(color: Colors.red),),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
