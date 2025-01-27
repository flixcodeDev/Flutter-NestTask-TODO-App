import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesttask/App_Pages/SearchPage.dart';
import 'package:nesttask/App_Pages/UpcomingTask.dart';
import 'package:nesttask/CustomButton/CustomContainer.dart';

import 'package:nesttask/CustomButton/NavigationDrawer.dart';

import 'package:nesttask/CustomButton/TaskContainer.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Color bgcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      drawer: NavDrawerPage(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){

            },
          icon :Icon(Icons.account_circle,
          size: 30,)

        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.list,
                size: 30,
              ))
        ],
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hello, Sakib!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "Have a nice day.",
                      style: TextStyle(
                          color: Colors.black.withOpacity(.5),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Customcontainer(title: "My Task",onTap: (){},),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                        Customcontainer(title: "In-Progress",onTap: (){},),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                        Customcontainer(title: "Completed",onTap: (){},),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Text("Progress",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    CustomTaskContainer(
                      title: "Data Science Quiz",
                      subtitle: "Date- 19Feb - 28Feb",
                      icon: Icon(
                        Icons.quiz,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    CustomTaskContainer(
                      title: "Data Science Quiz",
                      subtitle: "Date- 19Feb - 28Feb",
                      icon: Icon(
                        Icons.quiz,
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
            ]),
          )),
    );
  }
}
