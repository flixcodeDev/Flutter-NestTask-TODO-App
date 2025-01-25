import 'package:flutter/material.dart';
class CustomTaskContainer extends StatefulWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  const CustomTaskContainer({super.key, required this.title, required this.subtitle, required this.icon});

  @override
  State<CustomTaskContainer> createState() => _CustomTaskContainerState();
}

class _CustomTaskContainerState extends State<CustomTaskContainer> {

  bool done =false;
  @override
  Widget build(BuildContext context) {

    return Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.95,

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow:[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]

        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  children: [
                    // Icon Container
                    Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: widget.icon,
                        )
                    ),

                  ]
              ),
              // SizedBox(width: MediaQuery.of(context).size.width *0.03,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,style: TextStyle(color: Colors.black,fontWeight:FontWeight.w600,fontSize:15 ),),
                  SizedBox(height: MediaQuery.of(context).size.height *0.008),
                  Text(widget.subtitle,style: TextStyle(color: Colors.black.withOpacity(.5),fontSize:13 ),),

                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width *0.03,),
              Checkbox(value: done, onChanged: (value){
                setState(() {
                  done=value!;
                });
              }),
            ],
          ),
        ));
  }
}

