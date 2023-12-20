import 'package:flutter/material.dart';
import 'package:flutter_demo_joke/features/joke/presentation/pages/joke_screen.dart';
import 'features/joke/presentation/pages/jokes_list_screen.dart';
import 'injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Manrope',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const JokeScreen(),
        '/list': (context) => const JokeListScreen(),
      },
    );
  }
}

