import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../home/home_page.dart';
import '../services/auth_service.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';
import 'widgets/login_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  void _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    try {
      final res = await AuthService.signIn(
        _emailController.text,
        _passwordController.text,
      );
      if (res.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              LoginTextFormField(
                controller: _emailController,
                label: 'Email',
                icon: Icons.email,
                validator: (val) =>
                    val!.contains('@') ? null : 'Email inválido',
              ),
              const SizedBox(height: 16),
              LoginTextFormField(
                controller: _passwordController,
                label: 'Senha',
                icon: Icons.lock,
                isPassword: true,
                validator: (val) =>
                    val!.length >= 6 ? null : 'Mínimo 6 caracteres',
              ),
              const SizedBox(height: 24),
              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: const Text('Entrar'),
                    ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterPage()),
                ),
                child: const Text('Registrar-se'),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ForgotPasswordPage()),
                ),
                child: const Text('Esqueci minha senha'),
              )
            ],
          ),
        ),
      ),
    );
  }
}