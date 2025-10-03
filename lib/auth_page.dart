import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: SupaEmailAuth(
          redirectTo:
              'io.mydomain.myapp://callback', // Replace with your deep link
          onSignInComplete: (response) {
            // Handle successful sign-in
            // Navigation is now handled by AuthWrapper's StreamBuilder
            // No need to manually navigate here
          },
          onSignUpComplete: (response) {
            // Handle successful sign-up (e.g., show a message to check email)
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Please check your email to confirm your signup!',
                ),
              ),
            );
          },
          metadataFields: [
            MetaDataField(
              prefixIcon: const Icon(Icons.person),
              label: 'Username',
              key: 'username',
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Please enter something';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
