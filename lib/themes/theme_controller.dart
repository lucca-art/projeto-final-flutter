// lib/themes/theme_controller.dart
import 'package:flutter/material.dart';

class ThemeController {
  // ValueNotifier que mantém o estado atual do tema (light/dark)
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  // Alterna entre tema claro e escuro
  static void toggleTheme() {
    if (themeNotifier.value == ThemeMode.light) {
      themeNotifier.value = ThemeMode.dark;
    } else {
      themeNotifier.value = ThemeMode.light;
    }
  }
}
