// import 'package:flutter/material.dart';

// import '../../core/colors/colors.dart';

// class SelectionCard extends StatelessWidget {
//   const SelectionCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 140,
//       width: 170,
//       decoration: BoxDecoration(
//         border: _isSettingEnabled
//             ? Border.all(color: Colors.transparent)
//             : Border.all(color: BrandColors.kdisbleColor),
//         borderRadius: BorderRadius.circular(20),
//         color: _isSettingEnabled ? BrandColors.kSecondary : Colors.white,
//       ),
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(right: 75, top: 12),
//                 height: 45,
//                 width: 65,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(13),
//                   color: _isSettingEnabled
//                       ? BrandColors.kinner
//                       : BrandColors.kdisbleColor,
//                 ),
//                 child: Center(
//                   child: Text(
//                     centerText,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 4),
//                     child: Text(
//                       labelText,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: _isSettingEnabled
//                             ? Colors.white
//                             : BrandColors.kdisbleColor,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Transform.scale(
//                     scale: 0.89,
//                     child: AnimatedSwitcher(
//                       duration: const Duration(milliseconds: 200),
//                       transitionBuilder:
//                           (Widget child, Animation<double> animation) {
//                         return FadeTransition(
//                           opacity: animation,
//                           child: child,
//                         );
//                       },
//                       child: Switch(
//                         inactiveThumbColor: Colors.white,
//                         trackOutlineColor: const MaterialStatePropertyAll(
//                           Color(0x00ffffff),
//                         ),
//                         inactiveTrackColor: BrandColors.kbtndisbleColor,
//                         activeTrackColor: BrandColors.kinner,
//                         value: _isSettingEnabled,
//                         onChanged: (bool value) {
//                           setState(() {
//                             // _isSettingEnabled = value;
//                             selectedContainerIndex[centerText] = value;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//     ;
//   }
// }