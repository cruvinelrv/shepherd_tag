import 'package:flutter/material.dart';
import 'package:shepherd_tag/shepherd_tag.dart';
import 'lib/tags.dart';

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
                label: LoginPageTags
                    .emailField, // Placeholder but illustrating usage
                child: const TextField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
              ),
              const SizedBox(height: 16),
              Semantics(
                label: LoginPageTags.forgotPassword,
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ),
              const SizedBox(height: 32),
              Semantics(
                label: LoginPageTags.loginButton,
                child: ElevatedButton(
                  onPressed: () => debugPrint('Login pressed'),
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
