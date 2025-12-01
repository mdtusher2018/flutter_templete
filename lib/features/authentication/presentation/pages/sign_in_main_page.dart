// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:template/config/router/routes.dart';
// import '../../../../core/di/dependency_injection.dart';
// import 'package:template/features/authentication/domain/entites/signin_entity.dart';

// class SigninPage extends ConsumerWidget {
//   SigninPage({super.key});

//   final emailCtrl = TextEditingController(text: "businessman@gmail.com");
//   final passCtrl = TextEditingController(text: "hello123");

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(signinProvider);
//     ref.listen<AsyncValue<SigninEntity?>>(signinProvider, (prev, next) {
//       next.whenData((success) {
//         if (success != null) {
//           context.go(AppRoutes.home);
//         }
//       });
//     });
//     return Scaffold(
//       appBar: AppBar(title: const Text("Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailCtrl,
//               decoration: const InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: passCtrl,
//               obscureText: true,
//               decoration: const InputDecoration(labelText: 'Password'),
//             ),
//             const SizedBox(height: 20),
//             authState.isLoading
//                 ? const CircularProgressIndicator()
//                 : ElevatedButton(
//                   onPressed: () {
//                     ref
//                         .read(signinProvider.notifier)
//                         .login(
//                           email: emailCtrl.text.trim(),
//                           password: passCtrl.text.trim(),
//                         );
//                   },
//                   child: const Text("Login"),
//                 ),
//             if (authState.hasError)
//               Text(
//                 authState.error.toString(),
//                 style: const TextStyle(color: Colors.red),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
