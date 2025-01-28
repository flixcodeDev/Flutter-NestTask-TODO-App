import 'package:flutter/material.dart';
import 'package:nesttask/CustomButton/NavigationDrawer.dart';

import '../CustomButton/TaskContainer.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    body: Padding(padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchBar(
            hintText: "Search",
            leading: Icon(Icons.search_rounded),
            //overlayColor:Colors.deepPurpleAccent,
            focusNode: FocusNode(),
         backgroundColor: const MaterialStatePropertyAll(Colors.white),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tasks ",
                  style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomTaskContainer(
                    title: "Data Science Presentation",
                    subtitle: 'Date- 18Feb - 28 Jan',
                    icon: Icon(Icons.read_more)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTaskContainer(
                    title: "Data Science Assignment",
                    subtitle: 'Date- 18Feb - 28 Jan',
                    icon: Icon(Icons.read_more)),
              ],
            ),
          )
        ],
      ),

    ),
    );
  }
}
