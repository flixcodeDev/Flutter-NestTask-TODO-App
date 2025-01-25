import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customcontainer extends StatelessWidget {
  final String title;

  const Customcontainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 0.25,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow:[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(color: Colors.black,fontWeight:FontWeight.w600,fontSize:13 ),),

        ],
      ),
    );
  }
}
