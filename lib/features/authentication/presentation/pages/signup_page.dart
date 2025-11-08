import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/authentication/domain/entites/signup_entity.dart';
import 'package:template/features/authentication/presentation/pages/email_verification_page.dart';
import 'package:template/features/authentication/presentation/providers/auth_providers.dart';

class SignupPage extends ConsumerWidget {
  SignupPage({super.key});

  final emailCtrl = TextEditingController(text: "aaa@aaa.com");
  final passCtrl = TextEditingController(text: "hello123");
  final confirmPassCtrl = TextEditingController(text: "hello123");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupState = ref.watch(signupProvider);
    ref.listen<AsyncValue<SignupEntity?>>(signupProvider, (prev, next) {
      next.whenData((success) {
        if (success != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EmailVerificationPage();
              },
            ),
          );
        }
      });
    });
    return Scaffold(
      appBar: AppBar(title: const Text("Signup")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            TextField(
              controller: confirmPassCtrl,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
            ),
            const SizedBox(height: 20),
            signupState.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: () {
                    ref
                        .read(signupProvider.notifier)
                        .signup(
                          email: emailCtrl.text.trim(),
                          password: passCtrl.text.trim(),
                          confirmPassword: confirmPassCtrl.text.trim(),
                        );
                  },
                  child: const Text("Signup"),
                ),
            if (signupState.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  signupState.error.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
