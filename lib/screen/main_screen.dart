import 'package:flutter/material.dart';
import 'package:instagram_cl_a2/manager/firebase_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _manager = FirebaseManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_manager.getUser()?.email ?? ""),
      ),
    );
  }
}
