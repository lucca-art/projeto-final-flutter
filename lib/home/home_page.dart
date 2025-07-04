import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/auth_service.dart';
import '../login/login_page.dart';
import '../todo/todo_page.dart';
import '../themes/theme_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _signOut(BuildContext context) async {
    await AuthService.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo'),
        actions: [
          // Botão de troca de tema
          IconButton(
            icon: Icon(
              ThemeController.themeNotifier.value == ThemeMode.dark
                  ? Icons.wb_sunny
                  : Icons.dark_mode,
            ),
            onPressed: () {
              ThemeController.toggleTheme();
            },
            tooltip: 'Alternar tema',
          ),
          // Botão de logout
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
            tooltip: 'Sair',
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Olá, ${user?.email ?? 'usuário'}!',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TodoPage()),
              ),
              icon: const Icon(Icons.check_circle),
              label: const Text('Ir para Lista de Tarefas'),
            ),
          ],
        ),
      ),
    );
  }
}
