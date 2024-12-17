// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class FlexA extends StatelessWidget {
//   const FlexA({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Flex & Flexible Example")),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 // A row with two containers of different flex ratios
//                 SizedBox(
//                   height: 50,
//                   child: Expanded(
//                     flex: 2,
//                     child: Container(
//                       height: 100,
//                       color: Colors.blue,
//                       child: Center(
//                         child: ListView.builder(
//                             itemCount: 100,
//                             itemBuilder: (context, index) {
//                               return Text(
//                                 '$index',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 16),
//                               );
//                             }),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 // Container that takes 1/3 of the space
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     height: 100,
//                     color: Colors.green,
//                     child: Center(
//                       child: Text(
//                         '1/3 of space',
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Positioned(
//               bottom: 28.h,
//               left: 40.w,
//               right: 40.w,
//               child: Container(
//                 color: Colors.amber,
//                 height: 50,
//                 width: 75,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
