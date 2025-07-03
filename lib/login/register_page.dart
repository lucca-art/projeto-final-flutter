import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/auth_service.dart';
import '../login/widgets/login_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  void _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    try {
      final res = await AuthService.signUp(
        _emailController.text,
        _passwordController.text,
      );
      if (res.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário registrado com sucesso!')),
        );
        Navigator.pop(context);
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
      appBar: AppBar(title: const Text('Registrar-se')),
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
                      onPressed: _register,
                      child: const Text('Registrar-se'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
