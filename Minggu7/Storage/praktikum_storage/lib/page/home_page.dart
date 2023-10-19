// import 'package:flutter/material.dart';
// import '../utils/shared_preference.dart';
// import 'splash_page.dart';

// class HalamanHome extends StatefulWidget {
//   const HalamanHome({super.key});

//   @override
//   State<HalamanHome> createState() => _HomePageState();
// }

// class _HomePageState extends State<HalamanHome> {
//   String? username;
//   String? password;
//   String? email;

//   void initial() async {
//     username = await SharedPreference().getToken();

//     setState(() {});
//   }

//   @override
//   void initState() {
//     initial();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 16),
//           Text(username ?? "-"),
//           const SizedBox(height: 16),
//           Text(password ?? "-"),
//           const SizedBox(height: 16),
//           Text(email ?? "-"),
//           const SizedBox(height: 24),
//           Center(
//             child: ElevatedButton(
//               onPressed: () async {
//                 await SharedPreference().removeToken();
//                 Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => const HalamanSplash(),
//                     ),
//                     (route) => false);
//               },
//               child: const Text(
//                 'Log Out',
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
