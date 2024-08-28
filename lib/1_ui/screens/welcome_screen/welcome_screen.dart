// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:bank_el_ziker/1_ui/screens/welcome_screen/components/animated_start_widget.dart';
// import 'package:bank_el_ziker/consts/initial_data.dart';
// import 'package:bank_el_ziker/app_router.dart';
// import 'package:bank_el_ziker/consts/colors.dart';
// import 'package:bank_el_ziker/consts/text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:share_plus/share_plus.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: appWhite,
//         body: Column(
//           children: [
//             Expanded(
//               flex: 5,
//               child: Hero(
//                 tag: "green_welcome_to_home_container",
//                 child: Container(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 47.w, vertical: 10.h),
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(45.w),
//                       bottomRight: Radius.circular(45.w),
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Column(
//                               children: [
//                                 Stack(
//                                   children: [
//                                     Material(
//                                       type: MaterialType.transparency,
//                                       child: AutoSizeText(
//                                         'بنك',
//                                         textAlign: TextAlign.center,
//                                         // softWrap: true,
//                                         style: TextStyle(
//                                           fontFamily: "Cairo",
//                                           fontSize: 54.sp,
//                                           fontWeight: FontWeight.w800,
//                                           height: 1.2,
//                                           foreground: Paint()
//                                             ..style = PaintingStyle.stroke
//                                             ..strokeWidth = 2
//                                             ..color = const Color.fromRGBO(
//                                                 255, 241, 41, 1),
//                                         ),
//                                       ),
//                                     ),
//                                     Material(
//                                       type: MaterialType.transparency,
//                                       child: AutoSizeText(
//                                         'بنك',
//                                         textAlign: TextAlign.center,
//                                         // softWrap: true,
//                                         style: TextStyle(
//                                           fontFamily: "Cairo",
//                                           fontSize: 54.sp,
//                                           fontWeight: FontWeight.w800,
//                                           height: 1.2,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Stack(
//                                   children: [
//                                     Material(
//                                       type: MaterialType.transparency,
//                                       child: AutoSizeText(
//                                         'الذكر',
//                                         textAlign: TextAlign.center,
//                                         softWrap: true,
//                                         style: TextStyle(
//                                           fontFamily: "Cairo",
//                                           fontSize: 90.sp,
//                                           fontWeight: FontWeight.w800,
//                                           height: 1.2,
//                                           foreground: Paint()
//                                             ..style = PaintingStyle.stroke
//                                             ..strokeWidth = 2
//                                             ..color = const Color.fromRGBO(
//                                                 255, 241, 41, 1),
//                                         ),
//                                       ),
//                                     ),
//                                     Material(
//                                       type: MaterialType.transparency,
//                                       child: AutoSizeText(
//                                         'الذكر',
//                                         textAlign: TextAlign.center,
//                                         softWrap: true,
//                                         style: TextStyle(
//                                           fontFamily: "Cairo",
//                                           fontSize: 90.sp,
//                                           fontWeight: FontWeight.w800,
//                                           height: 1.2,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10.h,
//                             ),
//                             Material(
//                               type: MaterialType.transparency,
//                               child: AutoSizeText(
//                                 "عن أبي هريرة رضي الله عنه قال النبي صلى الله عليه وسلم: (سبَق المفردون، قالوا: وما المفردون يا رسول الله، قال: الذاكرون الله كثيرًا والذاكرات)؛ أخرجه مسلم.",
//                                 textAlign: TextAlign.center,
//                                 style: cairoTextStyle(
//                                     12.sp, FontWeight.w700, null, Colors.white),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 19.h),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             TextButton(
//                               onPressed: () {
//                                 Share.share(InitialData.shareMessage);
//                               },
//                               style: TextButton.styleFrom(
//                                 backgroundColor: Colors.white,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(
//                                       35.0), // Adjust the value as needed
//                                 ),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Image.asset(
//                                     'assets/images/share.png',
//                                     width: 37,
//                                     height: 37,
//                                     color: Theme.of(context).primaryColor,
//                                   ),
//                                   const SizedBox(
//                                     width: 11,
//                                   ),
//                                   Material(
//                                     type: MaterialType.transparency,
//                                     child: AutoSizeText(
//                                       "شارك الأجر مع أصدقائك",
//                                       textAlign: TextAlign.center,
//                                       style: cairoTextStyle(12.sp,
//                                           FontWeight.w700, null, Theme.of(context).primaryColor),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//                 flex: 1,
//                 child: GestureDetector(
//                     onTap: () {
//                       // print("dsfagd");
//                       Navigator.pushNamed(context, animatedSecondScreen);
//                     },
//                     child: const AnimatedStartWidget()))
//           ],
//         ));
//   }
// }
