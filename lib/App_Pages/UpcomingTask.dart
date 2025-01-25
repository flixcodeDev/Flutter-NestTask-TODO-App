// import 'package:flutter/material.dart';
// import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
// import 'package:nesttask/CustomButton/TaskContainer.dart';
//
// class Upcomingtask extends StatefulWidget {
//   const Upcomingtask({super.key});
//
//   @override
//   State<Upcomingtask> createState() => _UpcomingtaskState();
// }
//
// class _UpcomingtaskState extends State<Upcomingtask> {
//   bool date = false;
//   DateTime selectedDate = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: Icon(
//           Icons.arrow_back,
//           size: 30,
//           color: Colors.black,
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.menu_outlined,
//                 size: 30,
//               ))
//         ],
//       ),
//       body: Column(
//         children: [
//           // Horizontal Week Calendar
//           HorizontalWeekCalendar(
//             minDate: DateTime(2025, 1, 1),
//             maxDate: DateTime(2026, 1, 31),
//             initialDate: DateTime(2025, 1, 7),
//             onDateChange: (date) {
//               setState(() {
//                 selectedDate = date;
//               });
//             },
//             activeTextColor: Colors.white,
//             disabledBackgroundColor: Colors.white,
//             activeBackgroundColor: Colors.deepPurpleAccent,
//             inactiveBackgroundColor: Colors.deepPurpleAccent.withOpacity(.2),
//           ),
//           // Display Selected Date
//           // Padding(
//           //   padding: const EdgeInsets.all(16.0),
//           //   child: Text(
//           //     'Selected Date: ${selectedDate.toLocal()}',
//           //
//           //     style: TextStyle(fontSize: 18),
//           //   ),
//           // ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.03,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Tasks ",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.02,
//                 ),
//                 CustomTaskContainer(
//                     title: "Data Science Presentation",
//                     subtitle: 'Date- 18Feb - 28 Jan',
//                     icon: Icon(Icons.read_more)),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.03,
//                 ),
//                 CustomTaskContainer(
//                     title: "Data Science Assignment",
//                     subtitle: 'Date- 18Feb - 28 Jan',
//                     icon: Icon(Icons.read_more)),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
