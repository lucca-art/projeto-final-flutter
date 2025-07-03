import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static final _client = Supabase.instance.client;

  static Future<AuthResponse> signIn(String email, String password) {
    return _client.auth.signInWithPassword(email: email, password: password);
  }

  static Future<AuthResponse> signUp(String email, String password) {
    return _client.auth.signUp(email: email, password: password);
  }

  static Future<void> resetPassword(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }

  static User? get currentUser => _client.auth.currentUser;

  static Future<void> signOut() async {
    await _client.auth.signOut();
  }
}
