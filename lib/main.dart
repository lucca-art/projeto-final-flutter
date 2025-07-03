import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'splash/splash_screen.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';
import 'themes/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://bxwnixxwugpjctgamkwj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJ4d25peHh3dWdwamN0Z2Fta3dqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAyMTAxMzcsImV4cCI6MjA2NTc4NjEzN30.eEtJVzYEo5wZ_9Us7El8tvDatgI3aJUDgxThryKaWFA',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeController.themeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'Flutter Login App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
