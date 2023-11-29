import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:instagram_cl_a2/manager/firebase_manager.dart';
import 'package:instagram_cl_a2/screen/login_screen.dart';
import 'package:instagram_cl_a2/screen/main_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove(); /// mana
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown

  ]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _manager = FirebaseManager(); /// mana 1

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF96234C))
      ),
      home: _manager.getUser() == null ? const LoginScreen() : const MainScreen(), /// mana 2
    );
  }
}
