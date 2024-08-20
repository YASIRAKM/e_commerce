import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

final authProvider = Provider<FirebaseAuth>(
  (ref) {
    return FirebaseAuth.instance;
  },
);

final authStateProvider = StreamProvider<User?>(
  (ref) {
    final auth = ref.watch(authProvider);
    return auth.authStateChanges();
  },
);
final sighnInProvider = FutureProvider.family<void, String>(
  (ref, emailAndPassword) async {
    final auth = ref.watch(authProvider);
    final parts = emailAndPassword.split(',');
    if (parts.length != 2) throw Exception('Invalid input format');
    final email = parts[0];
    final password = parts[1];

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  },
);
