// import 'package:e_commerce_using_firebase/utils/sized_height.dart';
// import 'package:e_commerce_using_firebase/utils/text_field.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final email = TextEditingController();
//   final password = TextEditingController();
//   @override
//   void dispose() {
//     email.dispose();
//     password.dispose();
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             NewTextField(controller: email, label: "Email"),
//             sizeHieght(12),
//             NewTextField(
//               controller: password,
//               label: "Password",
//               isPassword: true,
//             ),
//             sizeHieght(12),
//             FilledButton(
//                 style: FilledButton.styleFrom(
//                     fixedSize: const Size.fromWidth(double.maxFinite)),
//                 onPressed: () {},
//                 child: const Text("sign in"))
//           ],
//         ),
//       ),
//     );
//   }
// }
