// import 'package:flutter/material.dart';
// import 'package:bottom_sheet/bottom_sheet.dart';
// class BottomSheet extends StatelessWidget 
// {
//   BottomSheet(
// {Key? key, 
// AnimationController? animationController, 
// bool enableDrag, 
// BottomSheetDragStartHandler? onDragStart, 
// BottomSheetDragEndHandler? onDragEnd, 
// Color? backgroundColor, 
// double? elevation, 
// ShapeBorder? shape, 
// Clip? clipBehavior, 
// required VoidCallback onClosing, 
// required WidgetBuilder builder}
// ) 

// bool _show = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Bottom Sheet"),
//       ),
//       body:Container(),
//       bottomSheet: BottomSheet(),
//     );
//   }

//   Widget _showBottomSheet()
//   {
//     if(_show)
//     {
//       return BottomSheet(
//         onClosing: () {
 
//         },
//         builder: (context) {
//           return Container(
//             height: 200,
//             width: double.infinity,
//             color: Colors.grey.shade200,
//             alignment: Alignment.center,
//             child: ElevatedButton(
//               child: Text("Close Bottom Sheet"),
//               style: ElevatedButton.styleFrom(
//                 onPrimary: Colors.white,
//                 primary: Colors.green,
 
//               ),
//               onPressed: () {
//                 _show = false;
//                 setState(() {
 
//                 });
//               },
//             ),
//           );
//         },
//       );
//     }
//     else{
//       return null;
//     }
//   }
// }