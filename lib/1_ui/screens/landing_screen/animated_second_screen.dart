// import 'dart:async';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:bank_el_ziker/consts/colors.dart';
// import 'package:flutter/material.dart';

// class AnimatedSecondScreen extends StatefulWidget {
//   const AnimatedSecondScreen({super.key});
//   @override
//   State<AnimatedSecondScreen> createState() => _AnimatedSecondScreenState();
// }

// class _AnimatedSecondScreenState extends State<AnimatedSecondScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );
//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );

//     _controller.forward();
//     Timer(Duration(seconds: 2), () {
//       // Navigate to the desired screen
//       Navigator.of(context).pushReplacementNamed('homeScreen');
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: appGreen,
//       body: Center(
//         child: Column(
//           children: [
//             AnimatedBuilder(
//               animation: _animation,
//               builder: (context, child) {
//                 return Transform.scale(
//                   scale: 1.5 - _animation.value,
//                   child: const AutoSizeText(
//                     'بنك الذكر',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 170,
//                       fontWeight: FontWeight.w800,
//                       fontFamily: 'Cairo',
//                       color: Colors.white,
//                       shadows: [
//                         Shadow(
//                             // bottomLeft
//                             offset: Offset(-1.5, -1.5),
//                             color: Colors.amber),
//                         Shadow(
//                             // bottomRight
//                             offset: Offset(1.5, -1.5),
//                             color: Colors.amber),
//                         Shadow(
//                             // topRight
//                             offset: Offset(1.5, 1.5),
//                             color: Colors.amber),
//                         Shadow(
//                             // topLeft
//                             offset: Offset(-1.5, 1.5),
//                             color: Colors.amber),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 "عن أبي هريرة رضي الله عنه قال النبي صلى الله عليه وسلم: (سبَق المفردون، قالوا: وما المفردون يا رسول الله، قال: الذاكرون الله كثيرًا والذاكرات)؛ \n أخرجه مسلم.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w800,
//                     fontFamily: 'Cairo',
//                     color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
