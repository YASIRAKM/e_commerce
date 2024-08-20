import 'package:e_commerce_using_firebase/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPages extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: authState.when(
        data: (user) {
          if (user != null) {
            // Navigate to home page or wherever you want
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/home');
            });
          }
          return LoginForm();
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class LoginForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration:const  InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration:const  InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
        const   SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final email = emailController.text;
              final password = passwordController.text;
              final emailAndPassword = '$email,$password';

              ref.read(sighnInProvider(emailAndPassword).future).then((_) {
                // Handle successful login if needed
              }).catchError((error) {
                // Handle login error
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Login failed: $error')),
                );
              });
            },
            child:const  Text('Login'),
          ),
        ],
      ),
    );
  }
}

