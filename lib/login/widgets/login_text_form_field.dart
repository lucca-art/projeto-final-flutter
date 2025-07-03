import 'package:flutter/material.dart';

class LoginTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool isPassword;

  const LoginTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<LoginTextFormField> createState() => _LoginTextFormFieldState();
}

class _LoginTextFormFieldState extends State<LoginTextFormField> {
  bool _obscureText = true;
  bool _hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) => setState(() => _hasFocus = focus),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword && _obscureText,
          validator: widget.validator,
          decoration: InputDecoration(
            labelText: widget.label,
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () => setState(() => _obscureText = !_obscureText),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: _hasFocus
                ? Theme.of(context).colorScheme.primary.withOpacity(0.05)
                : Colors.transparent,
          ),
        ),
      ),
    );
  }
}