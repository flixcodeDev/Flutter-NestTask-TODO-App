 import 'package:flutter/material.dart';
 import 'package:intl/intl.dart';
 import 'package:table_calendar/table_calendar.dart';

import '../CustomButton/NavigationDrawer.dart';
import '../CustomButton/TaskContainer.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TaskPage(),
//     );
//   }
// }

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Task Manager"),
      //   backgroundColor: Colors.deepPurpleAccent,
      // ),
      backgroundColor: Colors.white,
      drawer: NavDrawerPage(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(builder: (context) {
          return InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child:Icon(Icons.account_circle,size: 30,)
          );
        }),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.list,
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('MMMM, yyyy').format(_selectedDay),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _selectedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                  });
                },
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
              ),
              SizedBox(height: 20),
              Text("Tasks", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              //TaskCard(title: "Data Science Quiz", date: "19, Feb - 28, Feb"),
             // TaskCard(title: "Data Science Presentation", date: "19, Feb - 28, Feb"),
              CustomTaskContainer(
                title: "Data Science Presentation",
                subtitle: "Date- 20Feb - 28Feb",
                icon: Icon(
                  Icons.present_to_all,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              CustomTaskContainer(
                title: "Data Science Quiz",
                subtitle: "Date- 19Feb - 28Feb",
                icon: Icon(
                  Icons.quiz,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String date;

  TaskCard({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.assignment, color: Colors.deepPurple),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Date: $date"),
        trailing: Checkbox(value: false, onChanged: (bool? value) {}),
      ),
    );
  }
}
