import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nesttask/App_Pages/HomePage.dart';
import 'package:nesttask/Auth/login_page.dart';
import 'package:nesttask/Auth/register_page.dart';
import 'package:nesttask/CustomButton/BottomNavBar.dart';

import 'package:nesttask/CustomButton/customButton.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../CustomButton/CustomTextField.dart';

class Authpage extends StatefulWidget {
  const Authpage({super.key});

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  final _scrollController = ScrollController();

  var login = 0;

  // Future<void> register() async {
  //   final response = await Supabase.instance.client.auth.signInWithPassword(
  //       password: _passwordController.text, email: _emailController.text);
  //   try {
  //     if (response.user != null) {
  //       Get.off(const Bottomnavbar());
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Text(
                  login == 0 ? 'Login Your\nAccount' : 'Create Your\nAccount',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  login == 0
                      ? 'Login to enjoy the best managing experience'
                      : 'Sign-in up to enjoy the best managing experience',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35))),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: DefaultTabController(
                                  length: 2,
                                  child: TabBar(
                                    indicator: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    dividerHeight: 0,
                                    indicatorColor: Colors.white,
                                    labelStyle: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    labelColor: Colors.black,
                                    unselectedLabelColor: Colors.grey,
                                    onTap: (value) {
                                      login = value;
                                      setState(() {});
                                    },
                                    tabs: [
                                      Tab(text: "  Login  "),
                                      Tab(text: "  Register  ")
                                    ],
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.07),
                        login == 0 ? LoginPage() : RegisterView()
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
