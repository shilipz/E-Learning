import 'package:elearning/features/common_login/data/repository/repository.dart';
import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  ProfileDrawer({
    super.key,
  });
  final StudentRepository studentRepository = StudentRepository();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Center(
                child: Text(
              'Account',
              style: TextStyle(fontSize: 18),
            )),
            const SizedBox(height: 16),
            ClipRRect(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/home.jpg'),
              ),
            ),
            const Column(
              children: [
                Center(
                  child: Text('Jane Doe', style: TextStyle(fontSize: 18)),
                ),
                Text('Student')
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            const ListTile(
                leading: Text(
              'Settings',
              style: TextStyle(fontSize: 16),
            )),
            const ListTile(
                leading: Text('Subscriptions', style: TextStyle(fontSize: 16))),
            const ListTile(
                leading: Text('Payment', style: TextStyle(fontSize: 16))),
            InkWell(
              onTap: () {
                logoutAlert(context);
              },
              child: const ListTile(
                  leading: Text('Sign out', style: TextStyle(fontSize: 16))),
            ),
          ],
        ),
      ),
    );
  }

  void logoutAlert(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign-out'),
            content: const Text('Are you sure you want to Sign out?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                  onPressed: () {
                    studentRepository.logout();
                  },
                  child: const Text('Sign out'))
            ],
          );
        });
  }
}
