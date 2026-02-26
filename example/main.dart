// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:shepherd_tag/shepherd_tag.dart';

// -------------------------------------------------------------------
// CONTRACT FILE (lib/features/auth/auth_tags.dart)
// The developer creates one of these per feature/story and annotates
// it with @ShepherdTag so the Shepherd CLI can discover it.
// -------------------------------------------------------------------

@ShepherdTag(
  id: 'US-001',
  description: 'Login flow with valid credentials',
)
class AuthTags {
  /// Semantic key for the e-mail input field.
  static const String emailField = 'auth_email_field';

  /// Semantic key for the password input field.
  static const String passwordField = 'auth_password_field';

  /// Semantic key for the submit button.
  static const String submitButton = 'auth_submit_button';
}

// -------------------------------------------------------------------
// PAGE (lib/features/auth/presentation/login_page.dart)
// ShepherdPageTag wraps the page so the id is present in the
// widget tree — detectable by Maestro via Semantics.
// -------------------------------------------------------------------

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShepherdPageTag(
      id: 'US-001', // identifies the page by its User Story id
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Semantics(
                label: AuthTags.emailField,
                child: const TextField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
              ),
              const SizedBox(height: 16),
              Semantics(
                label: AuthTags.passwordField,
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),
              const SizedBox(height: 32),
              Semantics(
                label: AuthTags.submitButton,
                child: ElevatedButton(
                  onPressed: () => print('Login pressed'),
                  child: const Text('Sign In'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------
// APP ENTRY POINT
// -------------------------------------------------------------------

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shepherd Tag Example',
      home: const LoginPage(),
    );
  }
}
